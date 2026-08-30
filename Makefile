.PHONY: install serve build

install:
	pip install -r requirements.txt

serve:
	mkdocs serve

build:
	mkdocs build
