FROM node:17.9.0-bullseye

RUN apt -q update && apt -y -q install --no-install-recommends git 

ARG SSH_PRV_KEY
ARG SSH_PUB_KEY
RUN mkdir -p /root/.ssh && chmod 0700 /root/.ssh && ssh-keyscan github.com > /root/.ssh/known_hosts
RUN echo "$SSH_PRV_KEY" > /root/.ssh/id_rsa && echo "$SSH_PUB_KEY" > /root/.ssh/id_rsa.pub && chmod 600 /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa.pub

COPY . /app

WORKDIR /app

RUN npm install \
    && mv /app/dat /data \
    && ln -s /data /app/dat ## Assumes /data will store configuration and vaults

VOLUME /data 

ENV GIT_NAME=example
ENV GIT_MAIL=mail@example.com
ENV GIT_MESSAGE="auto commit"

ENTRYPOINT ["npm", "run", "dev"]
