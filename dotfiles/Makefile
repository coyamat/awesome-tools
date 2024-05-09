SHELL := /bin/zsh
ZSH_FILES := $(wildcard .zshrc*)
HOME_DIR := $(shell echo ~)

default:
	@for file in $(ZSH_FILES); do \
	echo "shfmt with $$file"; \
	shfmt -w $$file; \
	done

install:
	@for file in $(ZSH_FILES); do \
    echo "Copy $$file"; \
    cp $$file $(HOME_DIR); \
	done
