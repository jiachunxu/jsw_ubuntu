.PHONY: all clean run

# img_name=jsw_ubuntu
img_name=jiacx/jsw_ubuntu
container_name=u001
all:
	docker build -t $(img_name) .
	# docker tag jsw_ubuntu jiacx/jsw_ubuntu
	# docker push jiacx/jsw_ubuntu

run:
# 创建一个容器
	docker run -itd  --name $(container_name) --privileged --restart always $(img_name) 
	docker exec -it $(container_name) bash

clean:
	docker stop $(container_name)
	docker rm $(container_name)
	# docker rmi $(img_name)
