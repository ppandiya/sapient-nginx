#!/bin/bash
version=$1 
echo "Deploying Applicaition Version=$version"
sleep 30;

cont=$(sudo docker run -d -p 80:80 sriprasanna25/sapient-test:$version)

sleep 5;

output=$(curl -sL -w "%{http_code}\\n" "localhost" -o /dev/null)

if [ "$output" == "200" ];

then 

echo "Application is running";
sudo docker stop $cont
exit 0

else 

echo "Application startup failed $output"; 
sudo docker stop $cont
exit 1
fi


