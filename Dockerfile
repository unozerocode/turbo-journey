FROM alpine:latest
RUN apk add --update nodejs npm
RUN apk add inotify-tools
RUN apk add elixir 
COPY blank /app
WORKDIR /app/blank/assets 
RUN npm install
WORKDIR /app
RUN mix local.hex --force
RUN mix deps.get 
EXPOSE 4000
ENTRYPOINT ["mix", "phx.server"]
