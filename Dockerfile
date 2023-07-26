# Use the Nginx base image
FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/configfile.template

# Set the working directory in the container

# Copy the HTML, CSS, JS files to the container's working directory
COPY index.html /usr/share/nginx/html/index.html
COPY contactform /usr/share/nginx/html
COPY css /usr/share/nginx/html
COPY img /usr/share/nginx/html
COPY js /usr/share/nginx/html
COPY lib /usr/share/nginx/html

ENV PORT 8080
ENV HOST 0.0.0.0
EXPOSE 8080

CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
