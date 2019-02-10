PROJECT=gotify/build

build-windows-amd64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-windows-amd64 -f Dockerfile.windows-amd64 .

push-windows-amd64:
	docker push ${PROJECT}:${GO_VERSION}-windows-amd64

build-linux-amd64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-amd64 -f Dockerfile.linux-amd64 .

push-linux-amd64:
	docker push ${PROJECT}:${GO_VERSION}-linux-amd64

build-linux-arm-7:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-arm-7 -f Dockerfile.linux-arm-7 .

push-linux-arm-7:
	docker push ${PROJECT}:${GO_VERSION}-linux-arm-7
	
build-linux-arm64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-arm64 -f Dockerfile.linux-arm64 .

push-linux-arm64:
	docker push ${PROJECT}:${GO_VERSION}-linux-arm64

build: build-linux-amd64 build-linux-arm-7 build-linux-arm64 build-windows-amd64
push:  push-linux-amd64  push-linux-arm-7  push-linux-arm64  push-windows-amd64