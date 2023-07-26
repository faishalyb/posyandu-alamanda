# Use the Nginx base image
FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/configfile.template

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the HTML, CSS, JS files to the container's working directory
COPY . /usr/share/nginx/html/

ENV PORT 8080
ENV HOST 0.0.0.0
EXPOSE 8080

CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
