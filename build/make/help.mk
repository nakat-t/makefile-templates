#--------------------------------------------------------------------
# help.mk - Makefile help generater
#
# Usage:
#   1. Include this file near the top of your main project Makefile  
#      (or any sub-Makefile) so that it is parsed **before** the rules  
#      you want to document, e.g.  
#
#        include PATH/TO/help.mk
#
#   2. Add a single-line comment beginning with `### ` immediately **above**  
#      each rule you want to appear in the help output:  
#
#        .PHONY: build
#        ### Build the project
#        build:
#        	@echo "Building…"
#
#   3. Run `make help` to print the formatted list of targets:  
#
#        Available targets:
#          build           - Build the project
#          clean           - Clean artifacts
#          help            - Display this help message
#
#   4. (Optional) Change the width of the target column:  
#
#        HELP_TARGET_WIDTH := 25
#        include PATH/TO/help.mk
#
# How it works:
#   • Scans every makefile recorded in `$(MAKEFILE_LIST)`  
#   • Collects lines that start with `### ` as the *description*  
#   • Reads the next non-empty line to obtain the *target name(s)*  
#   • Supports multiple targets on the same rule line  
#   • Prints them formatted as `<target>  - <description>`  
#
# This helper is intended to be **included**, not executed directly.
#
# Variables:
#   - HELP_TARGET_WIDTH: Width of the target name column in the help output
#--------------------------------------------------------------------

HELP_TARGET_WIDTH ?= 15

.PHONY: help
### Display this help message
help:
	@echo "Available targets:"
	@awk ' \
	BEGIN { \
		target_width = $(HELP_TARGET_WIDTH); \
	} \
	/^### / { \
		desc = substr($$0, 5); \
		getline; \
		if ($$0 ~ /:/) { \
			target_line = $$0; \
			sub(/:.*/, "", target_line); \
			gsub(/[[:space:]]+/, " ", target_line); \
			split(target_line, targets, " "); \
			for (i in targets) { \
				if (targets[i] != "") { \
					printf "  %-*s - %s\n", target_width, targets[i], desc; \
				} \
			} \
		} \
	}' $(MAKEFILE_LIST)
