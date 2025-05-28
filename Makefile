.PHONY: all clean run

img_name=jsw_ubuntu
container_name=u001
all:
	docker build -t $(img_name) .

run: 
# 创建一个容器
	docker run -itd  --name $(container_name) --privileged --restart always $(img_name) 
	docker exec -it $(container_name) /bin/bash

clean:
	docker stop $(container_name)
	docker rm $(container_name)
	# docker rmi $(img_name)
