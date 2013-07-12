PWD = `pwd`
FILES = ".vimrc"
DIRS = ".vim"

all: init update linkfiles linkdirs

init:
	git submodule init

update:
	git submodule update

linkfiles:
	for file in $(FILES); do \
		ln -sf "$$PWD/$$file" ~/"$$file"; \
	done

linkdirs:
	for dir in $(DIRS); do \
		ln -sf "$$PWD/$$dir" ~/ ; \
	done
