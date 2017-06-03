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
       mkdir -p /hostdata/$client/$domain/
       cp -a /store/nginx/templates/public_html /hostdata/$client/$domain/public_html
       mkdir -p /hostdata/$client/$domain/logs
       mkdir -p /hostdata/$client/$domain/ssl
       mkdir -p /hostdata/$client/$domain/cache

       chown -R $domain:$domain /hostdata/$client
       chown -R $domain:$domain /hostdata/$client/$domain
       chown -R $domain:$domain /hostdata/$client/$domain/public_html
       chown -R $domain:$domain /hostdata/$client/$domain/public_html/*
       chown -R $domain:$domain /hostdata/$client/$domain/logs
       chown -R $domain:$domain /hostdata/$client/$domain/ssl
       chown -R $domain:$domain /hostdata/$client/$domain/cache
       chown -R $domain:$domain /nginx/live/$domain

       chown -R www-data:www-data /hostdata/$client/$domain
       chown -R www-data:www-data /hostdata/$client/$domain/public_html
       chown -R www-data:www-data /hostdata/$client/$domain/public_html/*
       
       adduser $domain
       usermod -d /hostdata/$client/$domain $domain
       usermod -s /sbin/nologin $domain
       # This will disable user to login on ssh.
       # And user Can create a FTP Session via customer panel when ever they want.
       passwd -l $domain
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
