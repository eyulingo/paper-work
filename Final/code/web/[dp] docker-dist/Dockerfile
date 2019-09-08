FROM node:10

# Create app directory
WORKDIR /usr/src/app

COPY ./eyulingo-dist/package*.json ./

RUN npm install

# Bundle app source
COPY ../eyulingo-dist/. .

EXPOSE 8082

CMD ["npm", "run serve"]