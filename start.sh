#!/bin/sh

echo '启动ss...'
nohup sslocal -c /etc/shadowsocks.json>/dev/null 2>&1 &
echo '你可以用命令测试 curl --socks5 127.0.0.1:1985 http://httpbin.org/ip 测试ss连接状态'

echo '启动privoxy...'
privoxy --user privoxy /usr/local/etc/privoxy/config

echo '输入以下命令开启流量转发：
export http_proxy=http://127.0.0.1:8118
export https_proxy=http://127.0.0.1:8118
'
