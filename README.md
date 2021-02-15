# Web Agency

This is a proof of concept to create a software system to host Wordpress websites. The system leverage on Docker and Wordpress to host easily new Wordpress websites with very few commands.

## Architecture

TODO

## How to use it

Open the ```.env``` file and customize the following values:

```
...
```

Run the following command to startup your wordpress stack:

```
docker-compose up -d
```

Add the following line to your ```/etc/hosts``` file.

```
127.0.0.1    www.mywebsite2.com
```

## Limitations
Currently, the code allows you simply to start a wordpress website in your local environment 

