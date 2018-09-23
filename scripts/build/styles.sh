#!/usr/bin/env bash

# $(basename $file) 使用basename函数, 取出文件名
for file in client/styles/*.css
do
  lessc $file | cssmin > dist/styles/$(basename $file)
done