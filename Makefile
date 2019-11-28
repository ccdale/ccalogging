SRC = ccalogging/__init__.py README.md setup.py

$(SRC):

tags:
	ctags -R

dev:
ifeq ($(strip $(VIRTUAL_ENV)),)
	@echo "You need to be in a virtual environment"
else
	pip install -e .
endif

install:
ifeq ($(strip $(VIRTUAL_ENV)),)
	pip install . --user
else
	@echo "installing into a virtual environment is not supported"
	@echo "use: `make dev` for that"
endif

dist:
ifeq ($(strip $(VIRTUAL_ENV)),)
	@echo "You need to be in a virtual environment"
else
	python setup.py sdist bdist_wheel
endif

pypi: dist
ifeq ($(strip $(VIRTUAL_ENV)),)
	@echo "You need to be in a virtual environment"
else
	twine upload dist/*
endif
