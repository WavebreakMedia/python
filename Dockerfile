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
    curl \
    unzip \
    jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o 1password.zip https://cache.agilebits.com/dist/1P/op/pkg/v$VERSION/op_linux_amd64_v$VERSION.zip && \
    unzip 1password.zip -d /usr/local/bin && \
    rm 1password.zip
ENV OP_CONNECT_HOST https://secrets.wbml.io/

ENV ROOT=/home/python
RUN mkdir -p $ROOT
COPY . $ROOT

CMD ["tail", "-f", "/dev/null"]
