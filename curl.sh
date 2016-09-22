#!/bin/bash

x=0
load_balancer_url=a3d246c9380a511e6877a0eb9328fd7b-844647308.us-east-1.elb.amazonaws.com

while [[ true ]]; do
       	curl $load_balancer_url
       	printf "\n"

       	if [[ `expr $x % 2` = 0 ]]; then
       		printf "+\n"
       	else
       		printf "*\n"
       	fi

       	x=`expr $x + 1`
       	sleep 0.5
done
