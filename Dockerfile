FROM node:18-alpine

WORKDIR /app

# copy backend package files
COPY TODO/todo_backend/package*.json ./TODO/todo_backend/

# install backend dependencies
RUN cd TODO/todo_backend && npm install

# copy the whole project
COPY . .

# expose port
EXPOSE 5000

# start backend server
CMD ["node", "TODO/todo_backend/server.js"]