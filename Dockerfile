FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

#COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm config set registry http://registry.npm.taobao.org/ && npm install

# will execute npm install in /home/app because of WORKDIR
# Install all dependencies
RUN npm install

COPY ./app /home/app

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
