FROM node

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

CMD ["node","server.js"]