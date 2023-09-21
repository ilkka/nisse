# Defaults for use later, these aren't actually visible inside the stages
# unless there's another arg clause in the stage.
ARG USERNAME=nisse
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG ELIXIR_VERSION=1.14.1


## **********************************************************************
## Base stage for dependencies and tools for dev, build and test
## **********************************************************************
FROM elixir:${ELIXIR_VERSION} as base
LABEL maintainer="Ilkka Poutanen <ilkka@ilkka.dev>"

RUN apt-get update \
  && apt-get install -y \
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
RUN MIX_ENV=dev mix do deps.get, deps.compile
RUN MIX_ENV=prod mix do deps.get, deps.compile
COPY . ./


## **********************************************************************
## Dev stage for running a dev server, or as a vs code dev container
## **********************************************************************
FROM base as develop
RUN apt-get update \
  && apt-get install -y tig httpie neovim less inotify-tools
CMD ["mix", "phx.server"]


## **********************************************************************
## Build sources from base stage
## **********************************************************************
FROM base as build
ENV MIX_ENV=prod
RUN mix do phx.digest, compile, assets.deploy


## **********************************************************************
## Package release
## **********************************************************************
FROM build as release
RUN mix do phx.gen.release, release


## **********************************************************************
## Run release in production mode
## **********************************************************************
FROM debian:12.1-slim as deploy
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
