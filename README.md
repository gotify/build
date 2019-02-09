# gotify/build

Docker images for building gotify/server and plugins: **[hub.docker.com/r/gotify/build](https://hub.docker.com/r/gotify/build/)**.

## Usage

### gotify/server

Set LD_FLAGS
```
$ export LD_FLAGS="-w -s -X main.Version=$(git describe --tags) -X main.BuildDate=$(date "+%F-%T") -X main.Commit=$(git rev-parse --verify HEAD) -X main.Mode=prod";
```

*windows amd64*
```bash
docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-windows-amd64 \
   go build -a -installsuffix cgo -ldflags "$LD_FLAGS" -o build/gotify-windows-amd64.exe /proj
```

*linux amd64*
```bash
docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-linux-amd64 \
   go build -a -installsuffix cgo -ldflags "$LD_FLAGS" -o build/gotify-linux-amd64 /proj
```

*linux arm-7*
```bash
docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-linux-arm-7 \
   go build -a -installsuffix cgo -ldflags "$LD_FLAGS" -o build/gotify-linux-arm-7 /proj
```

*linux arm64*
```bash
docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-linux-arm64 \
   go build -a -installsuffix cgo -ldflags "$LD_FLAGS" -o build/gotify-linux-arm64 /proj
```

### Plugins

*linux amd64*
```bash
$ docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-linux-amd64 \
     go build -a -installsuffix cgo -ldflags "-w -s" -buildmode=plugin -o yourplugin-amd64.so /proj
```
*linux arm-7*
```bash
$ docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-linux-arm-7 \
     go build -a -installsuffix cgo -ldflags "-w -s" -buildmode=plugin -o yourplugin-arm-7.so /proj
```
*linux arm64*
```bash
$ docker run --rm -v "$PWD/.:/proj" -w /proj gotify/build:v1-linux-arm64 \
     go build -a -installsuffix cgo -ldflags "-w -s" -buildmode=plugin -o yourplugin-arm64.so /proj
```

