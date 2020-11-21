#!/usr/bin/env bash
# 1.在build目录执行以下命令
/Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake .. -DCMAKE_INSTALL_PREFIX=/Users/liushiming/opt/mysql \
-DDEFAULT_CHARSET=utf8mb4 \
-DDEFAULT_COLLATION=utf8mb4_general_ci \
-DENABLED_LOCAL_INFILE=ON \
-DWITH_SSL=system \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DCOMPILATION_COMMENT="robert edition" \
-DWITH_BOOST=/Users/liushiming/CLionProjects/mysql-8.0.15/boost/boost_1_68_0 \
-DMYSQL_UNIX_ADDR=/Users/liushiming/opt/mysql/mysql.sock \
-DSYSCONFDIR=/Users/liushiming/opt/mysql

# 2.编译
make -j 12

# 3.初始化mysql
./bin/mysqld  --initialize-insecure --user=mysql --basedir=/Users/liushiming/opt/mysql --datadir=/Users/liushiming/opt/mysql/data

# 4.启动mysql，基于最小配置
./bin/mysqld --basedir=/Users/liushiming/opt/mysql --datadir=/Users/liushiming/opt/mysql/data --plugin-dir=/Users/liushiming/opt/mysql/lib/plugin --log-error=/Users/liushiming/opt/mysql/data/liushimingMacBook-Pro.local.err --pid-file=/Users/liushiming/opt/mysql/data/liushimingMacBook-Pro.local.pid --socket=/Users/liushiming/opt/mysql/data/mysql.sock

# 5.设置项目的cmake参数
-DCMAKE_INSTALL_PREFIX=/Users/liushiming/opt/mysql \
-DMYSQL_DATADIR=/Users/liushiming/opt/mysql/data \
-DSYSCONFDIR=/Users/liushiming/opt/mysql \
-DMYSQL_UNIX_ADDR=/Users/liushiming/opt/mysql/mysql.sock \
-DWITH_DEBUG=1  \
-DDOWNLOAD_BOOST=1
-DWITH_BOOST=/Users/liushiming/CLionProjects/mysql-8.0.15/boost/boost_1_68_0

# 6.启动参数
 --socket=/Users/liushiming/opt/mysql/data/mysql.sock