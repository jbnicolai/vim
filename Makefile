PWD = `pwd`
FILES = ".vimrc"
DIRS = ".vim"

all: submodule linkfiles linkdirs

submodule:
	git submodule update --init --recursive

linkfiles:
	for file in $(FILES); do \
		ln -sf "$$PWD/$$file" ~/"$$file"; \
	done

linkdirs:
	for dir in $(DIRS); do \
		ln -sf "$$PWD/$$dir" ~/ ; \
	done
