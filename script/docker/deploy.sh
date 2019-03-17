
#使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|base|modules|stop|rm|rmiNoneTag]"
	exit 1
}

#开启所需端口
port(){
	firewall-cmd --add-port=88/tcp --permanent
	firewall-cmd --add-port=8000/tcp --permanent
	firewall-cmd --add-port=8848/tcp --permanent
	firewall-cmd --add-port=3306/tcp --permanent
	firewall-cmd --add-port=3379/tcp --permanent
	firewall-cmd --add-port=7002/tcp --permanent
	service firewalld restart
}

##放置挂载文件
mount(){
	if test ! -f "/docker/nginx/gateway/nginx.conf" ;then
		mkdir -p /docker/nginx/gateway
		cp nginx/gateway/nginx.conf /docker/nginx/gateway/nginx.conf
	fi
	if test ! -f "/docker/nginx/web/nginx.conf" ;then
		mkdir -p /docker/nginx/web
		cp nginx/web/nginx.conf /docker/nginx/web/nginx.conf
		cp -r nginx/web/html /docker/nginx/web/html
	fi
	if test ! -f "/docker/nacos/init.d/custom.properties" ;then
		mkdir -p /docker/nacos/init.d
		cp nacos/custom.properties /docker/nacos/init.d/custom.properties
	fi
}

#启动基础模块
base(){
	docker-compose up -d nacos sentinel web-nginx blade-nginx blade-redis
}

#启动程序模块
modules(){
	docker-compose up -d blade-gateway1 blade-gateway2 blade-gateway3 blade-admin blade-auth blade-user blade-desk blade-system blade-log
}

#关闭所有模块
stop(){
	docker-compose stop
}

#删除所有模块
rm(){
	docker-compose rm
}

#删除Tag为空的镜像
rmiNoneTag(){
	docker images|grep none|awk '{print $3}'|xargs docker rmi -f
}

#根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"mount")
	mount
;;
"base")
	base
;;
"modules")
	modules
;;
"stop")
	stop
;;
"rm")
	rm
;;
"rmiNoneTag")
	rmiNoneTag
;;
*)
	usage
;;
esac
