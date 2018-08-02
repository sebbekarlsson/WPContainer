# WPContainer
> Wordpress Container with NGiNX, PHP5 and MySQL, using Debian Jessie.

## Running
> To get it up and running:

    docker build . -t wpcontainer
    docker run -d -p 80:80 wpcontainer

> It should now be accessible at [http://localhost](localhost)

## MySQL credentials
> The default credentails are:  
* root password: bad\_password
* wordpress user: wordpress
* wordpress user password: bad\_password
* wordpress database: wordpress
