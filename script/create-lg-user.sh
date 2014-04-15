#!/bin/bash
# 這支程式用來建立新增帳號，功能有：
# 1. 檢查 accounts.txt 是否存在，並將該檔案內的帳號取出；
# 2. 建立上述檔案的帳號；
# 3. 將上述帳號的密碼修訂成為『強制第一次進入需要修改密碼』的格式。
# 2014-04-15    VBird, creamidea
export PATH=/bin:/sbin:/usr/bin:/usr/sbin

# check accounts.txt is exist?
if [ ! -f accounts.txt ]; then
    echo "accounts.txt is not exist"
    exit 1
fi

usernames=$(cat accounts.txt)
for username in usernames; do
    useradd $username           # 新建帐号
    echo $username | passwd --stdin $username # 创建于帐号相同的密码
    chage -d 0 $username                      # 强制登录修改密码
done
