# Use the Nginx base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the HTML, CSS, JS files to the container's working directory
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY js/ /usr/share/nginx/html/js/
COPY contactform/ /usr/share/nginx/html/contactform/
COPY lib/ /usr/share/nginx/html/lib/
COPY img/ /usr/share/nginx/html/img/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
