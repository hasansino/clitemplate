export GO111MODULE:=auto
export GOPROXY:=http://athens.svc.ts.net:3000,direct
export GOSUMDB:=off
export CGO_ENABLED:=0
export GOOS:=linux
export GOARCH:=amd64

COMMIT_NUMBER?=latest

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $< | sort | awk 'BEGIN {FS = "|"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

## test | run unit tests
test:
	go test -v ./...

## build | buld binary
build:
	go build \
	-ldflags "-s -w -X main.buildDate=`date -u +%Y%m%d.%H%M%S` -X main.buildCommit=${COMMIT_NUMBER}" \
    -o .build/app main.go
	file .build/app
	du -h .build/app

## image | build docker image
image: build
	cp Dockerfile .build/
	cd .build && docker build -t clitemplate:latest -t clitemplate:${COMMIT_NUMBER} .
	rm -rf .build
