#!/bin/sh
echo '正在关闭ss...'
kill `ps -aux|grep /usr/bin/sslocal|grep -v grep |awk '{print $2}'`

echo '正在关闭privoxy...'
kill `ps -aux|grep "privoxy --user privoxy"|grep -v grep |awk '{print $2}'`


echo '输入以下命令关闭流量转发
unset http_proxy
unset https_proxy
'
