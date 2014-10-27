# TrainingApp

[ ![Codeship Status for mitchlloyd/training](https://www.codeship.io/projects/f1196a40-1aaa-0132-7edc-6605d664157f/status)](https://www.codeship.io/projects/34740)

## Prerequisites

* Ruby 2.0
* Rails 4
* PostgreSQL
* NPM
  * Ember CLI
  * Bower

## Getting Started

Check out the README under the client directory for more information on running the client app.


### Tests

```sh
rspec
client test
```

### Run the app locally

In two separate shells run:

```sh
./bin/server
./bin/client
```

(Those scripts just change into the spec/dummy directory and the client directory respectively and
run command. You should familiarize yourself with those scripts to understand what they are doing.)


After you start the server and client process you have 2 ways that you can
interact with the application.

First you can visit the dummy rails app, which has the client assets linked into
its public directory:

    http://localhost:3000/training/

Secondly you can visit the client app at:

    http://localhost:4200/#/courses/1/chaperts/1

In this case, all of the api requests will be proxied to the dummy Rails
application.

This project rocks and uses MIT-LICENSE.
