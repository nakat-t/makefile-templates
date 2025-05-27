#----------------------------------------------------------
# Makefile
#----------------------------------------------------------

# Shell settings
SHELL := bash
.SHELLFLAGS := -o pipefail -c

#----------------------------------------------------------
# Parameters
#----------------------------------------------------------

# Makefile include directory
MAKE_INC_DIR ?= ../../build/make

#----------------------------------------------------------
# Includes
#----------------------------------------------------------

include $(MAKE_INC_DIR)/help.mk

#----------------------------------------------------------
# Targets
#----------------------------------------------------------

.DEFAULT_GOAL := help

.PHONY: all
### Run all targets
all: build

.PHONY: build
### Build the project
build:
	@echo "Building the project..."
	@echo "Build complete."

.PHONY: clean
### Clean all build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@echo "Clean complete."
