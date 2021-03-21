GIT_VERSION=`git describe --tags`

# NOTE: if you dont want to use the sqlite database you can remove the json1 tag
.PHONY: cli
cli:
	go build --tags "json1" -ldflags "-X main.Version=$(GIT_VERSION)" .

.PHONY: docker
docker:
	docker build --build-arg VERSION=$(GIT_VERSION) -t bonedaddy/go-template:$(GIT_VERSION) .
	docker image tag bonedaddy/go-template:$(GIT_VERSION) bonedaddy/go-template:latest


.PHONY: release
release:
	./scripts/release.sh

.PHONY: tests
tests:
	go test --tags "json1" -count 1 -cover ./...