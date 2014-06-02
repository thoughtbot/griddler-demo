# Griddler Demo

A demo Rails app for [Griddler](http://griddler.io/).

Currently it only tests the Sendgrid adapter.

## To test Griddler

You should be able to send an email to `hi@incoming.griddler.io` and it will
show up on http://griddler-demo.herokuapp.com/ (after a refresh).

## Running tests

First set up the app:

    $ bin/setup

Then run Rake:

    $ rake
