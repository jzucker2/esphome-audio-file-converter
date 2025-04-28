# esphome-audio-file-converter

```
docker build -t audio-tools .
docker run -it --rm audio-tools
```

Or with compose:

```
docker compose up -d
docker compose ps
docker compose exec -it esphome-audio-file-converter /bin/bash
```

Inside the container:

```
audacity --help
sox --help
xxd --help
```

## Simple Dockerfile

```dockerfile
FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    audacity \
    sox \
    vim-common \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# xxd is part of vim-common package in Debian/Ubuntu
# Clean up to keep image small

# Set entrypoint
ENTRYPOINT ["/bin/bash"]
```

Consider turning into multi-stage build

## Notes

* https://hub.docker.com/r/linuxserver/audacity
