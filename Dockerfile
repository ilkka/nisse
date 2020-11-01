# Defaults for use later, these aren't actually visible inside the stages
# unless there's another arg clause in the stage.
ARG USERNAME=nisse
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG ELIXIR_VERSION=1.10.3


## **********************************************************************
## Base stage for dependencies and tools for dev, build and test
## **********************************************************************
FROM elixir:${ELIXIR_VERSION} as base
LABEL maintainer="Ilkka Poutanen <ilkka@ilkka.dev>"

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get update \
  && apt-get install -y \
  nodejs \
  postgresql-client \
  locales \
  zsh

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Non-root user for dev stuff etc
ARG USERNAME
ARG USER_UID
ARG USER_GID

ARG WORKDIR=/app

RUN mix local.hex --force \
  && mix local.rebar --force

WORKDIR /app
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY . ./


## **********************************************************************
## Dev stage for running a dev server, or as a vs code dev container
## **********************************************************************
FROM base as develop
RUN apt-get update \
  && apt-get install -y tig httpie neovim less inotify-tools
RUN npm install --prefix ./assets
CMD ["mix", "phx.server"]


## **********************************************************************
## Build sources from base stage
## **********************************************************************
FROM base as build
ENV MIX_ENV=prod
RUN npm ci --prefix ./assets \
  && npm run deploy --prefix ./assets \
  && mix do deps.compile, phx.digest, compile


## **********************************************************************
## Package release
## **********************************************************************
FROM build as release
RUN mix release


## **********************************************************************
## Run release in production mode
## **********************************************************************
FROM debian:buster-20200803-slim as deploy
LABEL maintainer="Ilkka Poutanen <ilkka@ilkka.dev>"
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install -y libssl1.1 \
  && rm -rf /var/lib/apt/lists/*
ARG USERNAME
ARG USER_UID
ARG USER_GID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
WORKDIR /app
COPY --from=release --chown=nisse /app/_build/prod/rel ./
USER $USERNAME
ENV LC_ALL=C.UTF-8 LANG=C.UTF-8
CMD ["/app/nisse/bin/nisse", "start"]