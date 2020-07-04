# README

Software Requirements
------------------------------------------------------------------------------------------------------------------------------
* Rails 5.0.0 or higher
* Ruby 2.3.1 or higher
* PostgreSQL 9.3.11 or higher

Create Account in GitHub and Heroku
------------------------------------------------------------------------------------------------------------------------------
Github
Heroku

Setup your development environment (Mac)
------------------------------------------------------------------------------------------------------------------------------
Go to the VirtualBlox Website, click the link to Download "OS X hosts". Open the dmg file that downloads, then double click on VirtualBpx.pkg that pops up and follow the instructions (you're clicking continue most of the time). Once you go through that step close out the "VirtualBox" window.

Go to the Vagrant Download Page, clikc Find the Mac OS X section and click "Universal (32 and 64-bit". Run the file you downloaded and follow the instructions (you're clicking next most of the time).

Turn on your Web Dev Environment
------------------------------------------------------------------------------------------------------------------------------
Open up the Terminal Window: Hold Command+Spacebar, in the Spotlight type 'Terminal' and hit the enter key.

A terminal window will come up, and then run the following two commands:

cd ~/Desktop/vagrant
Then type this command. It will need to download a large file, so it will take a few moments to complete:

vagrant up
NOTE: If this comes back with an error message telling you to run vagrant init DO NOT DO THAT. See this post here for details about how to fix this error message.

Log into your dev environment
------------------------------------------------------------------------------------------------------------------------------
To log into your web-dev environment follow the following steps:

First: After vagrant up finishes, in the terminal type:
vagrant ssh

Second: Then you'll be prompted with a terminal window inside your web development environment that looks like this:\
web-dev-environment

This brings you into your web dev environment ready to run commands.

Accounts
------------------------------------------------------------------------------------------------------------------------------
Generate SSH Key
Inside the web development terminal window, where it says [Web Dev] in blue, run the following lines one by one. important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line:

eval `ssh-agent -s`
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

Configure Heroku with SSH Keys
Update the heroku-cli with the following command:

wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

This will prompt you for your Heroku email and password. Run the following command to start to initiate the login process, then enter your email and password when you're prompted for it:

heroku login

Finally, add your ssh key to our heroku account:

heroku keys:add

Configure Github with SSH Keys
Then run this command. Once this command runs it will prompt you for your GitHub username (note this is your username not your email address) and your password. Enter these values and then press enter. It should tell you "ok!". If it gives you an error message you probably entered an invalid username and password (so try to run that command again).

curl https://gist.githubusercontent.com/kenmazaika/fa8ea7dfbae413638cfd111b974bc74a/raw/ecb5e91c044d92389d0cfd3c2229e57187384d6d/github_auth.rb  > ~/.firehose-github.rb && ruby ~/.firehose-github.rb

Once the dollar-sign returns, run these commands and provide your name and email address inside the double quotes instead of the dummy data:
git config --global user.email "you@example.com"

And then run:
git config --global user.name "Your Name"
##Amazon AWS services##

You need an amazon developer account for some image storage space on Amazons S3 service (this will cost you nothing)

Sign-up and create an account for Amazon Web Services. 

Test
------------------------------------------------------------------------------------------------------------------------------
cd /vagrant/src/grammable
rails s -b 0.0.0.0 -p 3000

Clone this repository
------------------------------------------------------------------------------------------------------------------------------
$ git clone https://github.com/YOUR-USERNAME/grammable.git

Navigate to the Rails application
------------------------------------------------------------------------------------------------------------------------------
$ cd grammable

Create, migrate and seed the database
------------------------------------------------------------------------------------------------------------------------------
$ rails db:create
$ rails db:migrate
$ rake db:seed

Production Deployment
------------------------------------------------------------------------------------------------------------------------------
$ git push heroku master
$ heroku run rake db:migrate

Support
------------------------------------------------------------------------------------------------------------------------------
Bug reports and feature requests can filed with the rest for the Ruby on Rails project here:
* File Bug Reports and Features
