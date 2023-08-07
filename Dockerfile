FROM node:18

WORKDIR /usr/src/app

COPY product/package*.json ./

RUN npm install

RUN npm install mysql cookie-parser body-parser express-session session-file-store method-override jsonwebtoken express ejs morgan

RUN mkdir /var/log/app

COPY product/. .

EXPOSE 3000

CMD [ "node", "index.js" ]
