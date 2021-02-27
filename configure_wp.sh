#!/bin/bash
SCRIPT_DIR=$( cd $(dirname $0) ; pwd -P )
source $SCRIPT_DIR/.env

###################################################################
# configure_wp_settings
#
# Input: none
# Description: this function configure Wordpress Settings menu pages.
# Return: none
###################################################################
configure_wp_settings() {
    echo "===== configure wordpress settings"

    # Modify Settings->General

    # Modify blog description
    wp option update blogdescription "$WORDPRESS_DESCRIPTION"

    # Modify Settings->Reading
    wp option update posts_per_page 6
    wp option update posts_per_rss 7

    # Modify Settings->Discussions
    wp option update thread_comments 0
    wp option update moderation_notify 0
    wp option update comment_whitelist 0
    wp option update show_avatars 0

    # Modify Settings->Permalink
    wp rewrite structure '/%postname%.html' --hard
    wp rewrite flush --hard
}

###################################################################
# configure_wp_plugins
#
# Input: none
# Description: this function configure Wordpress Plugins settings.
# Return: none
###################################################################
configure_wp_plugins() {
    if [ "$SCRIPT_DIR" == "/" ]
    then
        OPTIONS_PLUGINS_DIR="/options/plugins"
    else
        OPTIONS_PLUGINS_DIR="$SCRIPT_DIR/options/plugins"
    fi
    PLUGINS=$(ls $OPTIONS_PLUGINS_DIR)
    for plugin in "$PLUGINS"; do
        echo "Import options for the plugin $plugin"
        OPTIONS=$(ls $OPTIONS_PLUGINS_DIR/$plugin)
        for option in $OPTIONS; do
            wp option update $option --format=json < $OPTIONS_PLUGINS_DIR/$plugin/$option
        done
    done
}

###################################################################
# Main block
###################################################################
wp core install --url=$VIRTUAL_HOST --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_USER --admin_password=$WORDPRESS_PASSWD --admin_email=$WORDPRESS_USER_EMAIL; 
wp plugin delete hello akismet;
wp theme delete twentynineteen twentytwenty
for plugin in $WORDPRESS_PLUGINS; do
    echo "wp plugin install $plugin --activate"
    wp plugin install $plugin --activate
done
if [ ! -z "$WORDPRESS_THEME" ]
then
    wp theme install $WORDPRESS_THEME --activate
    wp theme delete twentytwentyone
fi
configure_wp_settings
configure_wp_plugins
