function install_nginx
{
	#echo "This function will install nginx"
	#sudo apt-get update

	sudo apt-get -y install nginx || (echo "Nginx installation Failed" && exit)

	#Start nginx
	sudo /etc/init.d/nginx start
	sudo /etc/init.d/nginx status

	#start nginx in all runlevels
	sudo update-rc.d nginx defaults
	return 0
}

function install_php5-fpm
{
	#echo "This function will install php"
	#Install php5-fpm
	sudo apt-get update || (echo "Update Failed" && exit)
	sudo apt-get -y install php5-fpm || (echo "php5-fpm Installation failed" && exit)

	#configure php
	#uncomment line in php.ini to make it work
        if [ -s /etc/php5/fpm/php.ini ];then
		sudo sed -i "/=msql.so/ s/;/ /" /etc/php5/fpm/php.ini
	fi

	#sudo sed -i "/cgi.fix_pathinfo=/ s/1/0/" /etc/php5/fpm/php.ini
	#sudo sed -i "/listen = / s/127\.0\.0\.1\:9000/\/var\/run\/php5-fpm\.sock/" /etc/php5/fpm/pool.d/www.conf
	
	sudo sed -i "/listen = / s/\/var\/run\/php5-fpm\.sock/127\.0\.0\.1\:9000/" /etc/php5/fpm/pool.d/www.conf

	#restart php
	sudo service php5-fpm restart || (echo "PHP restart Failed" && exit)
	return 0
}
