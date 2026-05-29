# Stage 1: Build
FROM node:18-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install 

COPY . .

# Stage 2: Serve

EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]