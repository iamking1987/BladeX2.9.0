##一、调整内存：max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]（elasticsearch用户拥有的内存权限太小，至少需要262144）

#### 修改配置sysctl.conf
[root@localhost ~]# vi /etc/sysctl.conf
#### 添加下面配置：
vm.max_map_count=262144
#### 重新加载：
[root@localhost ~]# sysctl -p
#### 最后重新启动elasticsearch，即可启动成功。


##二、Docker 命令自动补全
#### 安装依赖工具bash-complete
[root@localhost ~]# yum install -y bash-completion

[root@localhost ~]# source /usr/share/bash-completion/completions/docker

[root@localhost ~]# source /usr/share/bash-completion/bash_completion