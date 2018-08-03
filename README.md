# WPContainer
> Wordpress Container with NGiNX, PHP5 and MySQL, using Debian Jessie.

## Running
> To get it up and running:

    docker build . -t wpcontainer
    docker run -d -p 80:80 wpcontainer

> It should now be accessible at [http://localhost](localhost)

### File manager
> You will also be able to access the file manager after booting everything up,
> it is accessible at: [http://localhost:8080/filemanager](localhost:8080/filemanager).  
> Here, you can edit your wordpress files, upload themes, plugins etc.

## MySQL credentials
> The default credentails are:  
* root password: bad\_password
* wordpress user: wordpress
* wordpress user password: bad\_password
* wordpress database: wordpress
