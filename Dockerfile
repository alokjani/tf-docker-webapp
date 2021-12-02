FROM node:10
  
RUN mkdir /myapp

# Create app directory
WORKDIR /myapp

RUN npm install
RUN npm install -g nodemon

# Bundle app source
COPY . /myapp

EXPOSE 8080

CMD [ "nodemon", "app.js" ]
