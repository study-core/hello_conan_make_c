# 选择编译器和编译选项
CC = gcc
CFLAGS = -Wall -g

# 如果是 macOS，使用 clang 编译器
ifeq ($(shell uname), Darwin)
    CC = clang
    CFLAGS += -DPLATFORM_MAC
endif

# 如果是 Windows (MinGW)，使用 MinGW 编译器
ifeq ($(shell uname), MINGW32_NT)  # 或者使用 `$(findstring mingw, $(shell uname))` 来更准确地判断
    CC = x86_64-w64-mingw32-gcc
    CFLAGS += -DPLATFORM_WINDOWS
endif

# 加载 Conan 生成的 makefile 配置
include conandeps.mk

# 目标文件和源文件
TARGET = hello_conan_make_c
SRCS = main.c
OBJS = $(SRCS:.c=.o) 	

# 默认目标：生成可执行文件
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LIBS)

# 构建 .o 文件
%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# 清理构建文件
clean:
	rm -f $(TARGET) $(OBJS)

