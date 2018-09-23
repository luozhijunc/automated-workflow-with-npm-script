#!/usr/bin/env bash

# 顺序一定要正确, 否则会出现资源引用错乱。
for step in 'images' 'scripts' 'styles' 'hash'
do
  npm run build:$step
done