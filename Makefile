# Makefile for python code
#
# > make help
#
# The following commands can be used.
#
# install:  Installs development requirments

define find.functions
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
endef

help:
	@echo 'The following commands can be used.'
	@echo ''
	$(call find.functions)

PYTHON = python3
PIP = pip3

install: ## Installs development requirments
install:
	$(PIP) install -r requirements.txt --target source/python
