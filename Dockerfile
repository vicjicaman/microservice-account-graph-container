FROM node:8.13.0-alpine

RUN mkdir -p /env/app
RUN chown -R node /env/app

USER node

WORKDIR /env/app

ARG CACHEBUST=1
RUN echo "CACHE $CACHEBUST"

COPY --chown=node:node ./node_modules /app/node_modules

ENTRYPOINT ["node"]
CMD ["/env/app/node_modules/@nebulario/microservice-account-graph/dist/index.js"]
