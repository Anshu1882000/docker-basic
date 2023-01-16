FROM node:alpine as firstBlock

WORKDIR /var/app
COPY package.json .

RUN npm install
COPY . .

RUN ["npm", "run", "build"]



FROM nginx as secondBlock
EXPOSE 80
COPY --from=firstBlock /var/app/build /usr/share/nginx/html



