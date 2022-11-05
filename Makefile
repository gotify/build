PROJECT=gotify/build

build-windows-amd64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-windows-amd64 -f Dockerfile.windows-amd64 .

push-windows-amd64:
	docker push ${PROJECT}:${GO_VERSION}-windows-amd64

build-windows-386:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-windows-386 -f Dockerfile.windows-386 .

push-windows-386:
	docker push ${PROJECT}:${GO_VERSION}-windows-386

build-linux-amd64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-amd64 -f Dockerfile.linux-amd64 .

push-linux-amd64:
	docker push ${PROJECT}:${GO_VERSION}-linux-amd64

build-linux-386:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-386 -f Dockerfile.linux-386 .

push-linux-386:
	docker push ${PROJECT}:${GO_VERSION}-linux-386

build-linux-arm-7:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-arm-7 -f Dockerfile.linux-arm-7 .

push-linux-arm-7:
	docker push ${PROJECT}:${GO_VERSION}-linux-arm-7
	
build-linux-arm64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-arm64 -f Dockerfile.linux-arm64 .

push-linux-arm64:
	docker push ${PROJECT}:${GO_VERSION}-linux-arm64

build-linux-riscv64:
	docker build --build-arg GO_VERSION=${GO_VERSION} -t ${PROJECT}:${GO_VERSION}-linux-riscv64 -f Dockerfile.linux-riscv64 .

push-linux-riscv64:
	docker push ${PROJECT}:${GO_VERSION}-linux-riscv64

build: build-linux-amd64 build-linux-arm-7 build-linux-arm64 build-linux-riscv64 build-linux-386 build-windows-amd64 build-windows-386
push:  push-linux-amd64  push-linux-arm-7  push-linux-arm64 push-linux-riscv64 push-linux-386  push-windows-amd64  push-windows-386