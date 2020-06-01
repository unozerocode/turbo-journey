FROM alpine:latest
RUN apk add elixir 
COPY blank .
mix local.hex --force
RUN mix deps.get 
ENTRYPOINT ["mix phx.server"]
