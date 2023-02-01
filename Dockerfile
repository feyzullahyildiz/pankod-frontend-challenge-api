FROM node:14-alpine
RUN npm install -g json-server

WORKDIR /app
ADD db.json .
EXPOSE 8080
CMD ["json-server", "--host", "0.0.0.0", "--port", "8080", "./db.json"]