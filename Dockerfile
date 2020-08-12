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
  postgresql-client

# Non-root user for dev stuff etc
ARG USERNAME
ARG USER_UID
ARG USER_GID

ARG WORKDIR=/app

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  # Make user a sudoer
  && apt-get update \
  && apt-get install -y sudo \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  # Make user own the workdir
  && mkdir -p $WORKDIR \
  && chown $USER_UID:$USER_GID $WORKDIR

RUN mix local.hex --force \
  && mix local.rebar --force

WORKDIR /app
COPY --chown=${USER_UID}:${USER_GID} mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY --chown=${USER_UID}:${USER_GID} . ./


## **********************************************************************
## Dev stage for running a dev server, or as a vs code dev container
## **********************************************************************
FROM base as develop
RUN apt-get update \
  && apt-get install -y tig httpie neovim less locales inotify-tools \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
  && echo "LANG=en_US.UTF-8" >> /etc/environment \
  && locale-gen en_US.UTF-8

CMD ["mix", "phx.server"]


## **********************************************************************
## Build sources from base stage
## **********************************************************************
FROM base as build
ENV MIX_ENV=prod
RUN mix compile


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
ARG USERNAME
ARG USER_UID
ARG USER_GID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
WORKDIR /app
COPY --from=release --chown=nisse /app/_build/prod/rel ./
USER $USERNAME
CMD ["/app/nisse/bin/nisse", "start"]