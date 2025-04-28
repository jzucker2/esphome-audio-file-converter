# Stage 1 - Build stage
FROM debian:bullseye-slim as builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    audacity \
    sox \
    vim-common \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Stage 2 - Final slim image
FROM debian:bullseye-slim

# Install only runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libasound2 \
    libflac8 \
    libglib2.0-0 \
    libgtk-3-0 \
    libid3tag0 \
    libmad0 \
    libmp3lame0 \
    libogg0 \
    libpango-1.0-0 \
    libportaudio2 \
    libsndfile1 \
    libsox-fmt-all \
    libvorbis0a \
    libvorbisenc2 \
    libvorbisfile3 \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy binaries from builder
COPY --from=builder /usr/bin/sox /usr/bin/sox
COPY --from=builder /usr/bin/xxd /usr/bin/xxd
COPY --from=builder /usr/bin/audacity /usr/bin/audacity

# Also copy necessary shared libs if needed (optional optimization)

ENTRYPOINT ["/bin/bash"]
