FROM node:20.15
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production
COPY src/* .
EXPOSE 5001
ENV NODE_PORT 80
CMD [ "node", "index.js" ]