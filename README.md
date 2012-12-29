Obvious Status
==============

Status is an implementation of a twitter style status update app based on the Obvious Architecture (http://obvious.retromocha.com/).

The purpose of this project is be an example app to help explain the concepts of Obvious. 

Thanks to Obvious, it was trivially easy to make Status run as a web app, a json api, a command line app, 
and even a desktop app without changing any of the app/ code. Also, the data layer is pluggable, so Status apps can 
be powered by JSON files, MySQL, MongoDB, or even the Status json api by simply pointing the jack objects at different 
database plugs. 

Running The Tests
-----------------

To run the tests for the app/ is easy. In the obvious_status project root run:

    rake rspec

To continuously run the tests using guard, install guard and run:

    guard

The tests should all be green and run in about 0.02 seconds. 

Running The Apps
----------------

To make all the apps work, you will need to install the following gems: obvious, json, validation, sequel, moped, mysql, and 
rest-client. You can comment out the plugs that you don't need if you want to reduce dependencies or have problems installing
a particular gem.

To run the web app run:

    rake server

And navigate to http://localhost:9393/

To run the api app run:

    rake server

And navigate to http://localhost:9394/

To run the cli app run:

    cd delivery/cli
    ./status.rb

To run the desktop app you will need to install jruby and purple_shoes. After those are installed you would run:

    cd delivery/desktop
    jruby -J-XstartOnFirstThread --1.9 app.rb


The Development Process
-----------------------

If you look through the commit logs, you can get a better idea of what an Obvious app's development process looks like.
You start by sketching out the pseudocode of your app using descriptor files and using the 'obvious generate' command to 
turn the descriptor files into your project file structure and empty tests. Once you have pending tests, you build out
the application entities, actions, and contracts via TDD. Make the tests green! After your tests are green you can make 
a working implementation by combining your app actions with jacks and plugs in the delivery mechanism - like in your web 
app.

Status followed that pattern pretty closely. After the app/ folder code was all done and the tests were green, I didn't 
need to go back and touch it to build the different types of delivery mechanisms or to change databases. If the plugs didn't
work, the contracts would raise errors. Once the plugs were written to spec, everything just worked. Since the app actions
just return hashes, working with the output in various apps was trivial. No app logic leaked into controllers or views. 

The goal of Status was to show that both your delivery mechanism and your database can be decoupled and pluggable if you
use the Obvious Architecture. Tests are fast. Development is fun. 

If you have questions don't hesitate to tweet me @programminggeek 
