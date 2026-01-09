FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y curl build-essential libzmq3-dev python3.9

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

CMD ["npm", "test"]
