tie-theknot
===========

A web application used to advertise and coordinate a wedding.

Getting Started
---------------
Install [Git][1] and [Vagrant][2] on your machine, then run the following commands:

    # Download the code
    git clone https://github.com/ColinOrr/tie-theknot.git
    
    # Download the Vagrant base box
    vagrant box add precise32 http://files.vagrantup.com/precise32.box
    
    # Start up the Vagrant VM
    cd tie-theknot
    vagrant up
    
    # Launch the web site
    vagrant ssh
    cd /vagrant/code
    bundle install
    bundle exec rails s

All being well, you can now visit the site from your browser http://localhost:3000

[1]: https://help.github.com/articles/set-up-git
[2]: http://vagrantup.com/v1/docs/getting-started/index.html
