echo "Running the nginx container"

docker run --name nginx_cont_1 -p 80:80 -d nginx_img_1

echo "The Nginx service should be available at one of the following URL"

for i in $(docker-machine ls | awk '!/NAME/{print $1}' ) 
  do \
    for j in $(docker-machine env ${i}| sed -n -e '/export DOCKER_HOST/{s_[^/]*//__;s_:.*__;p;}');
      do echo "http://${j}:80"
    done
done
