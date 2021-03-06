clear
#安装Docker
echo -e "========================"
echo -e "正在安装 Docker "
#阿里云镜像似乎无了
#curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
curl -fsSL https://get.docker.com | bash -s docker
bash get-docker.sh
sleep 1s
echo -e "Docker 安装完成"
echo -e "========================"
#启用Docker
echo -e "========================"
echo -e "启用 Docker "
service docker restart
echo -e "========================"

clear

#拉取镜像
echo -e "拉取 Docker 镜像 liuliwanjia/v2docker:speedtestx"
docker pull liuliwanjia/v2docker:speedtestx
echo -e "完成"

clear

#以5210端口运行
echo -e "启用 Docker 以5210端口运行speedtestx"
docker run -d -p 5210:80 -it liuliwanjia/v2docker:speedtestx

ip=$(wget -qO- -t1 -T2 ipinfo.io/ip)
if [[ -z "${ip}" ]]; then
	ip=$(wget -qO- -t1 -T2 api.ip.sb/ip)
	if [[ -z "${ip}" ]]; then
		ip=$(wget -qO- -t1 -T2 members.3322.org/dyndns/getip)
		if [[ -z "${ip}" ]]; then
			ip="VPS_IP"
		fi
	fi
fi

clear

echo -e " "
echo -e " "
echo -e " "
echo -e "Docker-speedtestx搭载完毕"
echo -e "在线测速地址"
echo -e "http://${ip}:5210"
echo -e " "
echo -e " "
