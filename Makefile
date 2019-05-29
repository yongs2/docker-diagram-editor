.PHONY: build
build:
	docker build -t diagram-editor -f Dockerfile .

.PHONY: run
run:
	docker run -d -p 3002:8080 --rm --name diagram-editor diagram-editor || :

.PHONY: exec
exec:
	docker exec -it diagram-editor /bin/bash || :

.PHONY: stop
stop:
	docker stop diagram-editor || :

.PHONY: logs
logs:
	docker logs -f diagram-editor || :
