FROM node:10

# Create app directory
WORKDIR /usr/src/app

COPY ../eyulingo-admin/package*.json ./

RUN npm install

# Bundle app source
COPY ../eyulingo-admin/. .

EXPOSE 8081

CMD ["npm", "run serve"]