#!/bin/bash

echo ${var1:=default} # var 未定义或已定义但值为空则替换为 default

echo ${var2=default} # var2 未定义则替换为 default

echo ${var3:-OK} # var3 未定义或已定义但值为空则显示 OK

echo ${var4-OK}  # var4 未定义则显示 OK

var5=xx
echo ${var5:?error} # var5 已定义且非空则显示 $var5，否则显示 error 并报错退出

var6=
echo ${var6?error} # var6 已定义则显示 $var6，否则显示 error 并报错退出

var7=jj
echo ${var7:+OK} # var7 已定义且非空则显示 OK，否则显示 null

var8=
echo ${var8+OK} # var8 已定义则显示 OK，否则显示 null