#!/bin/sh
yum install -y gcc autoconf python
python get-pip.py
pip install --upgrade pip
pip install shadowsocks


tar -zxvf privoxy-3.0.26-stable-src.tar.gz
cd privoxy-3.0.26-stable

echo '创建了一个用户privoxy'
useradd privoxy

autoheader && autoconf
./configure
make && make install

echo '你需要修改/etc/shadowsocks.json并删除#后的注释
{
  "server":"x.x.x.x",             #你的 ss 服务器 ip
  "server_port":0,                #你的 ss 服务器端口
  "local_address": "127.0.0.1",   #本地ip
  "local_port":0,                 #本地端口
  "password":"password",          #连接 ss 密码
  "timeout":300,                  #等待超时
  "method":"aes-256-cfb",         #加密方式
  "workers": 1                    #工作线程数
}'

echo '你还需要删除/usr/local/etc/privoxy/config中两行的注释
listen-address 127.0.0.1:8118   # 8118 是默认端口，不用改，下面会用到
forward-socks5t / 127.0.0.1:0 . # 这里的端口写 shadowsocks 的本地端口（注意最后那个 . 不要漏了）
'
