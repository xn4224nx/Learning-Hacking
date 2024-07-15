#!/bin/bash
# Running an Apache Server

HOMEPAGE="/var/www/html/index.html"

# Check if the software is installed and if not install it
if [ "$(which apache2)" == "" ]; then
    sudo apt update
    sudo apt install apache2
fi

# Start the apache service
sudo service apache2 start

# View the homepage running on your computer
open http://localhost

# Generate a web page an overwrite the current page
WEBPAGE="
<html>
<body>

<h1>System Summary</h1>

<p>Datetime     - $(date)</p>
<p>Current User - $(whoami)</p>
<p>Uptime       - $(uptime)</p>

</body>
</html>
"

# Stop the service to change the files
sudo service apache2 stop

# Set owner to the current user
sudo chown $(whoami) $HOMEPAGE

# Give it execute permission
sudo chmod u+x $HOMEPAGE

#Overwrite the current webpage
sudo echo $WEBPAGE > $HOMEPAGE

# View the new homepage running on your computer
sudo service apache2 restart
open  http://localhost

# Stop the apache server
sudo service apache2 stop
