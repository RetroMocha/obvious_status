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

To make all the apps work, you will need to install the following gems: json, validation, sequel, moped, mysql, and 
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
