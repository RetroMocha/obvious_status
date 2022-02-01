Obvious Status
==============

Status is an implementation of a twitter style status update app based on the
Obvious Architecture.

The purpose of this project is be an example app to help explain the concepts of
Obvious.

Basic Structure
---------------

Obvious is not traditional MVC. It's a different approach. The business logic
and the data persistence are separated into separate folders. The app folder
contains your business rules and entities, which would be the M in the MVC
pattern. The  external folder contains your data persistence layer - ORM's,
API's, caching, queues. The delivery folder is where the VC in MVC would live.

Running The Tests
-----------------

To run the tests for the app/ is easy. In the obvious_status project root run:

    bundle install
    rake rspec

To continuously run the tests using guard, install guard and run:

    bundle exec guard

The tests should all be green and run in about 0.02 seconds.

Running The Apps
----------------

To run the web app run:

    bundle install
    rake server

And navigate to http://localhost:9393/

To run the cli app run:

    cd delivery/cli
    ./status.rb
