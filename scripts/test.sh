#!/bin/bash
version=$1 
cont=$(sudo docker run -d -p 80:80 sriprasanna25/sapient-test:$version)

output=$(curl -sL -w "%{http_code}\\n" "localhost" -o /dev/null)

if [ "$output" == "200" ];

then 

echo "Application is running";
sudo docker stop $cont
else 

echo "Application startup failed $output"; 
sudo docker stop $cont
fi


