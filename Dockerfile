FROM node:lts-alpine AS build

WORKDIR /build

RUN apk add --no-cache git
RUN git clone --depth 1 --branch "master" https://github.com/trickypr/sync-party
WORKDIR /build/sync-party

COPY ./.env.build ./.env
RUN npm ci
RUN npm run prod:server:build
RUN npm run prod:client:build

RUN rm -rf node_modules
RUN npm ci --omit=dev

COPY ./scripts/run.sh .
RUN chmod +x ./run.sh

# ==============================================================================
# This builds the final image, which should be significantly smaller (e.g. 
# 240MB vs 600MB)

FROM node:lts-alpine

WORKDIR /app
COPY --from=build /build/sync-party .
# Remove the build .env file
RUN rm -rf .env 

CMD [ "ash", "./run.sh" ]
