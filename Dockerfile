FROM python:bookworm

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -yq --no-install-recommends \
    libgl1-mesa-glx \
    wget \
    locales \
    ca-certificates \
    python3-distutils \
    git \
    nano \
    redis-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["tail", "-f", "/dev/null"]