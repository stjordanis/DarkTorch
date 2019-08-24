sudo docker rm --force $(sudo docker ps -a -q)
sudo docker rmi $( sudo docker images -q -f dangling=true)
