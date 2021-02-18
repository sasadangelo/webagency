#!/bin/bash
SCRIPT_DIR=$( cd $(dirname $0) ; pwd -P )
source $SCRIPT_DIR/.env

wp core install --url=$VIRTUAL_HOST --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_USER --admin_password=$WORDPRESS_PASSWD --admin_email=$WORDPRESS_USER_EMAIL; 
wp plugin delete hello akismet;
wp theme delete twentynineteen twentytwenty
