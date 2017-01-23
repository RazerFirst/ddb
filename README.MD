/opt/chefdk/embedded/bin/gem install kitchen-docker -v 2.5.0

docker run -d --name dynamodb -p 8000:8000 deangiberson/aws-dynamodb-local 
