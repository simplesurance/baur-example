DOCKER_IMG=ownyourbits/mmake@sha256:c43710f2234e13666b8672a3b6e4f1706335a116ad5f9b8dc77fcf234aa08166
default: dist/unixtime

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
cur_dir := $(dir $(mkfile_path))

%.o: %.c $(HEADERS)
	gcc -frandom-seed=1 -c $< -o $@

dist/unixtime: main.o
	mkdir -p dist
	gcc $< -o $@

.PHONY: clean
clean:
	rm -f main.o
	rm -rf dist

.PHONY: build
build:
	docker run \
		--rm --init\
		-e HOME=/tmp/\
		--user=$(shell id -u):$(shell id -g)\
		--entrypoint=""\
		-v $(cur_dir):/code -w /code\
		$(DOCKER_IMG)\
		make
