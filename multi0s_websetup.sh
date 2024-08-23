#!/bin/bash
  
# Variable declaration
URL="https://www.tooplate.com/zip-templates/2134_gotto_job.zip"
ART_NAME="2134_gotto_job"
TEMP_DIR="/tmp/webfiles"
DEV_NULL="/dev/null"
yum --help &> $DEV_NULL

if [$? -eq 0]
then   
	# Set variables for CentOS
	PACKAGE="httpd wget unzip"
        SVC="httpd"

	echo "Running setup on CentOS"

	# Installing Dependecies
	echo "######################################"
	echo "Installing packages"
	echo "######################################"

	sudo yum install $PACKAGE -y > /dev/null
	echo 
	# Start and Enable Service
	echo "######################################"
        echo "Start and Enable HTTPD Service"
        echo "######################################"
	sudo systemctl start $SVC
	sudo systemctl enable $SVC
	echo "######################################"
        echo "Creating temp directory"
        echo "######################################"
	mkdir -p $TEMP_DIR
	cd $TEMP_DIR
	echo "######################################"
        echo "Starting artifacts deployment"
        echo "######################################"
	wget $URL > $DEV_NULL
	unzip $ART_NAME.zip > $DEV_NULL
	sudo cp -r $ART_NAME/* /var/www/html/  
	echo
	# Bounce service
	echo "######################################"
        echo "Restarting HTTPS Service"
        echo "######################################"
	sudo systemctl restart $SVC
	echo
	# Clean up
	echo "######################################"
        echo "Removing Temp files"
        echo "######################################"
	rm -rf $TEMP_DIR
	echo
	sudo systemctl status $SVC
	ls /var/www/html/

else
        # Set variables for Ubuntu
        PACKAGE="apache2 wget unzip"
        SVC="apache2"

        echo "Running setup on Ubuntu"

        # Installing Dependecies
        echo "######################################"
        echo "Installing packages"
        echo "######################################"
	sudo apt update
	sudo apt install $PACKAGE -y > /dev/null
        echo
        # Start and Enable Service
        echo "######################################"
        echo "Start and Enable APACHE2 Service"
        echo "######################################"
        sudo systemctl start $SVC
        sudo systemctl enable $SVC
        echo "######################################"
        echo "Creating temp directory"
        echo "######################################"
        mkdir -p $TEMP_DIR
        cd $TEMP_DIR
        echo "######################################"
        echo "Starting artifacts deployment"
        echo "##################################"
	wget $URL > $DEV_NULL
        unzip $ART_NAME.zip > $DEV_NULL
        sudo cp -r $ART_NAME/* /var/www/html/
        echo
        # Bounce service
        echo "######################################"
        echo "Restarting HTTPS Service"
        echo "######################################"
        sudo systemctl restart $SVC
        echo
        # Clean up
        echo "######################################"
        echo "Removing Temp files"
        echo "######################################"
        rm -rf $TEMP_DIR
        echo
        sudo systemctl status $SVC
        ls /var/www/html/
fi
