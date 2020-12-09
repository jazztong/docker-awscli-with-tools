export LAB_NAME=docker-awscli-with-tools

env:
	docker build -t ${LAB_NAME} .

login:
	docker run \
		-it \
		--rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${PWD}:/aws \
		-p 5000:5000 \
		-p 80:80 \
		--entrypoint sh \
		--name ${LAB_NAME} \
		${LAB_NAME}