#!/bin/bash

ACTION=$1
DOMAIN=$2
ALTDOMAIN="www.$DOMAIN"
LOCALHOST="127.0.0.1"
HOSTS="/etc/hosts"

if [ $ACTION == "add" ]; then

    sudo sh -c "echo '$LOCALHOST $DOMAIN' >> $HOSTS" 
    sudo sh -c "echo '$LOCALHOST $ALTDOMAIN' >> $HOSTS"
    echo "$DOMAIN has been added to $HOSTS."

elif [ $ACTION == "del" ]; then

    sudo sed -i "/$DOMAIN/d" "$HOSTS"
    echo "$DOMAIN has been removed from $HOSTS."
fi

echo "You may have to restart for the changes to take effect."
