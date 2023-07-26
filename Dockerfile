# Use the Nginx base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the HTML, CSS, JS files to the container's working directory
COPY index.html .
COPY css/ css/
COPY js/ js/
COPY contactform/ contactform/
COPY lib/ lib/
COPY img/ img/

CMD ["nginx", "-g", "daemon off;"]
