# Web Agency

This is a proof of concept to create a software system to host Wordpress websites. The system leverage on Docker and Wordpress to host easily new Wordpress websites with very few commands.

## Architecture

TODO

## How to use it

Open the ```.env``` file and customize the following values:

```
# MySQL environment variables
MYSQL_ROOT_PASSWORD=password
MYSQL_USER=wpuser
MYSQL_PASSWORD=password
MYSQL_DATABASE=wpdb

# Wordpress environment variables
VIRTUAL_HOST=www.mywebsite2.com
WORDPRESS_DB_USER=wpuser
WORDPRESS_DB_PASSWORD=password
WORDPRESS_DB_NAME=wpdb

# Nginx environment variables
DEFAULT_HOST=www.mywebsite2.com
```

Run the following command to startup your wordpress stack:

```
docker-compose up -d
```

Add the following line to your ```/etc/hosts``` file.

```
127.0.0.1    www.mywebsite2.com
```

Open the browser and type ```www.mywebsite2.com```in the address bar.

## Limitations

Currently, the code allows you simply to start a wordpress website in your local environment 

# Known Problems

TODO
