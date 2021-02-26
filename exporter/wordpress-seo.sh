#!/bin/bash
SCRIPT_DIR=$( cd $(dirname $0) ; pwd -P )
WORDPRESS_SEO_DIR=$SCRIPT_DIR/../plugins_settings/wordpress-seo

wp() {
    docker run -i --rm -e HOME=/tmp --dns=8.8.8.8 --network webagency-net -v wordpress_volume:/var/www/html -u xfs wordpress:cli "$@"
}
export -f wp

# Wordpress SEO options
declare -a options=("wpseo" "wpseo_flush_rewrite" "wpseo_ryte" "wpseo_social" "wpseo_titles")

###################################################################
# Main block
###################################################################
mkdir -p $WORDPRESS_SEO_DIR
for option in "${options[@]}"
do
    wp option get $option --format=json | jq > $WORDPRESS_SEO_DIR/$option
done
