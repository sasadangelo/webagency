# Web Agency

This is a project for educational purpose and a proof of concept to create a WordPress hosting system based on Docker and Kubernetes. The system leverage on Docker, MySQL and Wordpress to easily create a website just configuring a configuration file and running a single command. 

As a first step, I will try to create on a single machine multiple website using Docker and the official images of WordPress, WordPress Cli, MySQL, and NgInx-Proxy. The latter image will be used to access to the websites on the 80 port and specifying a different domain for each website.

In a next step, I will add Kubernetes to host on multiple node and managing high availability scenarios. A monitor system will be implemented to monitor the nodes and scale up and down the system. A backup container will be available to manage disaster recovery scenarios.

## Architecture

TODO

## How to use it

Open the ```.env``` file and customize the following values:

```
# Docker MySQL environment variables
MYSQL_ROOT_PASSWORD=password
MYSQL_USER=wpuser
MYSQL_PASSWORD=password
MYSQL_DATABASE=wpdb

# Docker Wordpress environment variables
VIRTUAL_HOST=www.mywebsite2.com
WORDPRESS_DB_USER=wpuser
WORDPRESS_DB_PASSWORD=password
WORDPRESS_DB_NAME=wpdb

# Wordpress CLI environment variables 
WORDPRESS_TITLE=MyWebsite
WORDPRESS_USER=admin
WORDPRESS_PASSWD=password
WORDPRESS_USER_EMAIL=info@mywebsite2.com

# Wordpress plugins and theme to install
WORDPRESS_PLUGINS="antispam-bee better-font-awesome contact-form-7 cookie-law-info php-code-widget re-add-underline-justify custom-css-js social-media-widget w3-total-cache widget-logic wordpress-seo wp-google-maps"
WORDPRESS_THEME=vantage

# Nginx environment variables
DEFAULT_HOST=www.mywebsite2.com```

Run the following command to startup your wordpress stack:

```
docker-compose up -d
```

Add the following line to your ```/etc/hosts``` file.

```
127.0.0.1    www.mywebsite2.com
```

Open the browser and type ```www.mywebsite2.com```in the address bar.

Run the following command if you want to destroy your conatiners:

```
docker-compose down [-v]
```

The -v option remove all the volumes created.

## Limitations

Currently, the code allows you simply to start a wordpress website in your local environment 

## Known Problems

TODO
