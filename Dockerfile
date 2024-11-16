#tagging this phase as builder 

FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#to host simple static files we need to copy the build to /usr/share/ngnix/html

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 