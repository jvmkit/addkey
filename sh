#!/bin/bash

# 指定公钥内容
PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSBxwIchWNQb2rhtE8VNm9Vd1RFvHaG5rBdgVh+5FyfCm0WABa0Q2dYfcL9ICqxwXwUeX3AQzLTI8u/8WSxOr83ZCXKy2kaxsllPOHmriAOGQtxuShioU+oKgw1rETtXlioYfUWQvZETOoEpdqrswtvSwe7PAk0wy8Dsi98CWR/KdGT5E6h7k8rGvtZexJRE80SpQARtcd5yYFKJwy5R3PkG0ARQvhFVBXvyYYmf/9h+g9/HDd2YZADcT60Fx61KCboWXGUWVQpUKLzaLDLIgrF15Vzls18xB4iCbI9jp33uQDxkOorM03OT7zWiuikWVfy1NPEpXwhR+mGuoTkDh7S1S063AbUjscSraA+jS/esk9zWP70sGIfRitEgrZn/BBWkuC60sgUcw3YJhmwDixQJM/0BF9Yp8FK8/zgmye5XsXneYFwG0skG9IHDu0mvHctKlEJb3nfVDQYl3aFy22tw3SA6K4dFeoUCtD3vvnZEVfp7AzSV+PJAKYWNOBhVU= chenyingjie@baiccl.com"

# 检查并创建 .ssh 目录
SSH_DIR="$HOME/.ssh"
if [ ! -d "$SSH_DIR" ]; then
    echo "创建 .ssh 目录..."
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"
fi

# 检查 authorized_keys 文件是否存在
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"
if [ ! -f "$AUTHORIZED_KEYS" ]; then
    echo "创建 authorized_keys 文件..."
    touch "$AUTHORIZED_KEYS"
    chmod 600 "$AUTHORIZED_KEYS"
fi

# 检查公钥是否已存在
if grep -qF "$PUBLIC_KEY" "$AUTHORIZED_KEYS"; then
    echo "公钥已存在于 authorized_keys 文件中。"
else
    echo "添加公钥到 authorized_keys..."
    echo "$PUBLIC_KEY" >> "$AUTHORIZED_KEYS"
    chmod 600 "$AUTHORIZED_KEYS"
    echo "公钥添加成功！"
fi
