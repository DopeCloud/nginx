#!/bin/bash

# STATIC = The bash script which will create virtualhost config for static page, which support only those langs.
# ===========================================================
# ===========================================================
# 1. HTML.
# 2. JAVASCRIPT.
# 3. XML.
# 4. CSS.
# 5. (Langs will updated after sometime.)
# ===========================================================
# ===========================================================

# ===========================================================
# START EVERYTIME.
# ===========================================================

cdir() {
       mkdir -p /home/$client/$domain/
       cp -a /store/nginx/templates/public_html /home/$client/$domain/public_html
       mkdir -p /home/$client/$domain/logs
       mkdir -p /home/$client/$domain/ssl
       mkdir -p /home/$client/$domain/cache

       chown -R $client:$client /home/$client
       chown -R $client:$client /home/$client/$domain
       chown -R $client:$client /home/$client/$domain/public_html
       chown -R $client:$client /home/$client/$domain/public_html/*
       chown -R $client:$client /home/$client/$domain/logs
       chown -R $client:$client /home/$client/$domain/ssl
       chown -R $client:$client /home/$client/$domain/cache

       chown -R www-data:www-data /home/$client/$domain
       chown -R www-data:www-data /home/$client/$domain/public_html
       chown -R www-data:www-data /home/$client/$domain/public_html/*
}

# ===========================================================
# END EVERYTIME.
# ===========================================================

# ===========================================================
# START NON-SSL PROCCESS.
# ===========================================================

create() {
       cp /store/nginx/templates/static-html-full /nginx/live/$domain
       sed -r -i "s/changeme/$domain/g" /nginx/live/$domain
       sed -r -i "s/theclient/$client/g" /nginx/live/$domain
       service nginx reload
}

# ===========================================================
# END NON-SSL PROCCESS.
# ===========================================================
