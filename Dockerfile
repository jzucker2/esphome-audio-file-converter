FROM debian:bullseye-slim AS builder

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
