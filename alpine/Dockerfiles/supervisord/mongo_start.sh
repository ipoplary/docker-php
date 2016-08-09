#!/bin/sh

chown -R mongodb.mongodb /var/lib/mongodb
/usr/bin/mongod --dbpath=/var/lib/mongodb