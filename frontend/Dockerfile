FROM node:18-alpine AS build

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY frontend/package*.json ./frontend/

# Install dependencies
RUN npm ci
RUN cd frontend && npm ci

# Copy source code
COPY . .

# Build
RUN cd frontend && npm run build

# Production stage
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY --from=build /app/frontend/dist/frontend ./frontend/dist/frontend

EXPOSE 3000

CMD ["node", "server.js"]