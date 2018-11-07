DOCKER_IMG=ownyourbits/mmake@sha256:c43710f2234e13666b8672a3b6e4f1706335a116ad5f9b8dc77fcf234aa08166
default: dist/unixtime

%.o: %.c $(HEADERS)
	gcc -frandom-seed=1 -c $< -o $@

dist/unixtime: main.o
	mkdir -p dist
	gcc $< -o $@

clean:
	rm -f main.o
	rm -rf dist

docker_build:
	docker run \
		--rm --init\
		-e HOME=/tmp/\
		--user=$(shell id -u):$(shell id -g)\
		--entrypoint=""\
		-v $(PWD):/code -w /code\
		$(DOCKER_IMG)\
		make
