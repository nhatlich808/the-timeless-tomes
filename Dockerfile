FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    postgresql-client \
    gnupg \
    lsb-release \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs
RUN npm install -g wrangler@latest
WORKDIR /app
COPY . .
CMD ["bash"]
