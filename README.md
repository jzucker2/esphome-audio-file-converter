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
