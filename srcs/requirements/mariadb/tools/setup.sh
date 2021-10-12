# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akezanna <akezanna@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/21 10:42:56 by akezanna          #+#    #+#              #
#    Updated: 2021/09/22 09:56:41 by akezanna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    
    mysql_install_db
    service mysql start
    
    mysqladmin -u root password $MARIADB_ROOT_PASS
    echo  "CREATE USER '${MARIADB_LOGIN}'@'localhost' identified by '${MARIADB_PASS}';" | mariadb -u root -p$MARIADB_ROOT_PASS
	echo "CREATE DATABASE IF NOT EXISTS wp_database;" | mariadb -u root -p$MARIADB_ROOT_PASS
	echo "GRANT ALL PRIVILEGES ON wp_database.* TO '${MARIADB_LOGIN}'@'%' IDENTIFIED BY '${MARIADB_PASS}';" | mariadb -u root -p$MARIADB_ROOT_PASS
	echo "FLUSH PRIVILEGES;" | mariadb -u root -p$MARIADB_ROOT_PASS
    service mysql stop 
fi
#sleep 5
mysqld
