.PHONY: all test clean

all: clean test showtime

clean:
	find . -name \*.pyc -delete
	rm -f ./rc.zsh.zwc

test:
	# ./run_tests.sh
