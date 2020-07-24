FROM elixir:1.10.3 as base
LABEL maintainer="Ilkka Poutanen <ilkka@ilkka.dev>"

ENV MIX_ENV=prod

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get update \
  && apt-get install -y \
  nodejs \
  postgresql-client

RUN mix local.hex --force \
  && mix local.rebar --force

WORKDIR /app
COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY . ./


FROM base as develop
RUN apt-get update \
  && apt-get install -y tig httpie neovim less
CMD ["mix", "phx.server"]


FROM base as build
RUN mix compile


FROM build as release
RUN mix release


FROM elixir:1.10.3-slim as deploy
LABEL maintainer="Ilkka Poutanen <ilkka@ilkka.dev>"
WORKDIR /app
COPY --from=release /app/_build/prod/rel ./
CMD ["/app/nisse/bin/nisse", "start"]