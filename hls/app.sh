#! /bin/bash
#export KEYCLOAKIPRESOLVE='ping -c 1 -t 1 $KEYCLOAKIP | grep PING | sed -e "s/).*//" | sed -e "s/.*(//"'
#export KEYCLOAKIPRESOLVE='localhost'
#export KEYCLOAKIPRESOLVE=`localhost`
export KEYCLOAKIPRESOLVE='192.168.122.20'
echo $KEYCLOAKIPRESOLVE
node app.js > keycloak.json
npm start
