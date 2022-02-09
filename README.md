Obvious Status
==============

Status is an implementation of a twitter style status update app based on the
Obvious Architecture.

The purpose of this project is be an example app to help explain the concepts of
Obvious.

Basic Structure
---------------

Obvious is not MVC. It's a different approach. The business logic and the data 
persistence are separated. 

 - `app` folder contains your business rules and entities. 
 - `external` folder contains your data persistence layer - ORM's, API's, caching, 
queues. 
 - `delivery` folder is where your delivery specific details - UI, 
configuration, routing, etc. live.
 - `test` folder contains your tests 😃

Installation
------------

To do basic install run:
    
    bundle install

That should install required ruby gems to get the project running.

Running The Tests
-----------------

To run the tests for the app/ is easy. In the project root run:

    rake test

The tests should all be green and run in about 0.01 seconds.

Running The Apps
----------------

To run the web app run:

    rake server

And navigate to http://localhost:4567/

To run the cli app run:

    cd delivery/cli
    ./status.rb
