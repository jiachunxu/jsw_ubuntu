.PHONY: all clean run

all:
	docker build -t ubuntu-custom .

run: 
# 创建一个容器
	docker run -itd  --name u001 --restart always ubuntu-custom 
	docker exec -it u001 /bin/bash

clean:
	docker stop u001
	docker rm u001