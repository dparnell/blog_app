FROM elixir:1.4

EXPOSE 4000
ENV PORT=4000 MIX_ENV=dev TERM=xterm

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mkdir -p /app/config
WORKDIR /app
VOLUME /app

CMD /bin/bash
