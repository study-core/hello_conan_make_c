# 配置

## connan


### connonfile.txt


```txt
[requires]
# 项目所依赖的外部库
zlib/1.2.11

[generators]
# 构建工具配置, make 就写 makefile; CMake 就写 cmake
makefile
```

### 使用 Conan 安装依赖

```sh
conan install . --build=missing
```


