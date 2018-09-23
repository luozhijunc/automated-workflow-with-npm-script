#!/usr/bin/env bash


# **/*.ext   **匹配任意层级目录, *代表所有文件。
# 给图片资源加上版本号，并且替换引用
# hashmark -c dist -r -l 8 '**/*.{png,jpg}' '{dir}/{name}.{hash}{ext}' | replaceinfiles -S -s 'dist/**/*.css' -d '{dir}/{base}'

# hsah images
# 目录dist, 在原地重命名掉, 长度是8, 匹配模式是**/*, 输出的格式是保留原来的目录和文件名.哈希.扩展名, 把源文件和有版本号的文件映射保存在images.json中。
hashmark -c dist -r -l 8 '**/*.{png,jpg}' '{dir}/{name}.{hash}{ext}' --asset-map=images.json

# replace image hash in css
# 输入来自于dist/images.json    源文件是'dist/**/*.css'(要替换的内容)  输出也保留了目录和文件名.
replaceinfiles -r dist/images.json -s 'dist/**/*.css' -d '{dir}/{base}'

# 给js, css资源加上版本号, 并且替换引用
# hashmark -c dist -r -l 8 '**/*.{css,js}' '{dir}/{name}.{hash}{ext}' | replaceinfiles -S -s 'client/index.html' -d 'dist/index.html'

# hsah css/js
hashmark -c dist -r -l 8 '**/*.{js,css}' '{dir}/{name}.{hash}{ext}' --asset-map=assets.json

# replace js/css hash in html
replaceinfiles -r dist/assets.json -s 'client/index.html' -d 'dist/index.html'
