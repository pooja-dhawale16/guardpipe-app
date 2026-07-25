FROM node:20-alpine AS build
WORKDIR /app
COPY app/package.json .
RUN npm install --production
COPY app/ .

FROM gcr.io/distroless/nodejs20-debian12
WORKDIR /app
COPY --from=build /app /app
EXPOSE 3000
CMD ["server.js"]
