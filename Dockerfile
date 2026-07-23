FROM node:20-alpine AS build
WORKDIR /app
COPY app/package.json .
RUN npm install --production
COPY app/ .

FROM node:20-alpine
WORKDIR /app
RUN addgroup -S app && adduser -S app -G app
COPY --from=build /app /app
USER app
EXPOSE 3000
CMD ["node", "server.js"]
