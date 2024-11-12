FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --no-audit
COPY . .
EXPOSE 8080
CMD ["node", "app.js"]
