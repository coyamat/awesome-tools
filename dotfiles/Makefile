SHELL := /bin/zsh
ZSH_FILES := $(wildcard .zshrc*)

default:
	@for file in $(ZSH_FILES); do \
	echo "shfmt with $$file"; \
	shfmt -w $$file; \
	done

