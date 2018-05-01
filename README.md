# Build

`docker build -t stterm .`

# Install

`docker run --rm -v "$PWD/output:/output" stterm`

# Configuration

## Copy config.h

1. `docker create --name stterm stterm`
2. `docker cp stterm:/stterm/config.def.h ./config.h`
3. `docker rm stterm`

## Build with config.h

`docker run --rm -v "$PWD/output:/output" -v "$PWD/config.h:/stterm/config.h" stterm`
