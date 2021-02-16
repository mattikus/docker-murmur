#!/bin/sh 

if [ "$SUPERUSER_PASSWORD" ]; then
	/opt/murmur/murmur.x86 -supw $SUPERUSER_PASSWORD
fi

/opt/murmur/murmur.x86 -fg -v
