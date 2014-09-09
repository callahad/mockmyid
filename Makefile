build:
	docker build -t callahad/mockmyid .

run:
	docker run --detach=true --publish=55001:80 --name "mockmyid.com" callahad/mockmyid
