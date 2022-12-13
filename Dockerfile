FROM node:lts-alpine

# Create app directory
WORKDIR /DockerHW/usr/src/app

RUN addgroup app && adduser -S -G app app && chown -R app /DockerHW/usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

WORKDIR /DockerHW

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 80
CMD [ "node", "server.js" ]
