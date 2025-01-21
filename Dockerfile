# Use Amazon Linux 2 as the base image 
FROM amazonlinux 

# Install Nginx and clean up unnecessary files 
RUN yum -y update && \ 
    yum -y install nginx && \ 
    yum clean all 

# Set the working directory 
WORKDIR /usr/share/nginx/html 

# Download index.html from the GitHub repository 
RUN curl -o index.html https://raw.githubusercontent.com/koti021/project03/main/index.html

# Expose port 80 for Nginx 
EXPOSE 80 

# Start Nginx in the foreground (daemon off) 
CMD ["nginx", "-g", "daemon off;"]
