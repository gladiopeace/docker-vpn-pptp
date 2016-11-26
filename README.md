# VPN (PPTP) for Docker

默认用户名Test，密码passwd

如果需要修改密码可以自己link /etc/ppp/chap-secrets文件或在build时修改./etc下面的配置文件

文件样板：

````
# Secrets for authentication using PAP
# client    server      secret      acceptable local IP addresses
username    *           password    *
````


# 启动服务

启动命令:

````
docker run \
  -d \
  --privileged \
  -p 1723:1723 \
  -v {local_path_to_chap_secrets}:/etc/ppp/chap-secrets \
  --net=host\
  --restart=always\
  mobtitude/vpn-pptp
````

# 启动后的操作

这里仅仅是启动了VPN服务，还没有配置iptabes转发，允许forward。
这里的配置会应用在宿主机上，因此删除了容器中的相关配置，建议手动在宿主机上配置。

