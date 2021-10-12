# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: akezanna <akezanna@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/21 10:41:28 by akezanna          #+#    #+#              #
#    Updated: 2021/09/22 11:24:48 by akezanna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if  [ ! -f /var/www/wordpress/wp-config.php ]; then    
    wp core --allow-root download --locale=fr_FR --force 
    while  [ ! -f /var/www/wordpress/wp-config.php ]; do    
        wp core config --allow-root --dbname=wp_database --dbuser=$MARIADB_LOGIN --dbpass=$MARIADB_PASS --dbhost=mariadb:3306
    done 
    wp core install --allow-root --url='akezanna.42.fr' --title='Akezanna Inception' --admin_user=$WPA_LOGIN --admin_password=$WPA_PASS  --admin_email="admin@admin.fr" --path='/var/www/wordpress';
    wp  user create --allow-root $WPU_LOGIN user2@user.com --user_pass=$WPU_PASS --role=author
    wp theme install --allow-root dark-mode --activate     
fi 
php-fpm7.3 --nodaemonize
