tie-theknot
===========

A web application used to advertise and coordinate a wedding.

Getting Started
---------------
1. Install [Git][1] and [Vagrant][2] on your machine.
2. Download the code
    ~> git clone https://github.com/ColinOrr/tie-theknot.git
3. Download the Vagrant base box
    ~> vagrant box add precise32 http://files.vagrantup.com/precise32.box
4. Start up the Vagrant VM
    ~> cd tie-theknot
    ~/tie-theknot>vagrant up
5. Launch the web site
    ~/tie-theknot>vagrant ssh
    > cd /vagrant/code
    > bundle exec rails s
6. Visit the site from your browser [http://localhost:3000]

[1]: https://help.github.com/articles/set-up-git
[2]: http://vagrantup.com/v1/docs/getting-started/index.html
