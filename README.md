# Harvard CS50’s Web Programming with Python and JavaScript
Final Project - Capstone
---

For the final project I decided to develop something that *I* would be interested to use myself. I habitually try not to leave lights unnecessarily on but until I developed this web app, I could not tell you what change a small action like this could achieve in terms of energy saving and more importantly in terms of **money** and **environmental impact**.

The underlying concept of a calculator and keeping a record of actions and their consequences can easily be adapted to many other scenarios, for example optimizing use of scarce resources by large teams in a business environment.

# Carbonator

Carbonator is a web app designed to help you combat climate change by reducing your own carbon footprint.

It helps you find out how small actions, such as switching off a light bulb or tv all contribute to saving energy.

We all know intuitively that we should use less energy but it is not always
easy to comprehend, let alone explain to others, the individual and cumulative impact of each small action.

Carbonator helps quantify these impacts, putting them in perspective. That means using Carbonator, you can make better informed decisions about the trade-offs we all have to consider 
in our daily lives.

It could also be used as an educational tool by teachers and parents to make abstract concepts of energy use and its monetary and environmental consequences more tangible.

<p align="center"><img src="images/carbonator_main.png" width="80%"></p>

## Distinctiveness and Complexity:

Carbonator combines an online calculator with the ability to store compare users' achievements, adding a competitive element.

All visitors are free to play around with the calculator and see how much energy they could save by switching off a light bulb for 30 minutes for example.

If they register, they can "bank" a saving which presents them instantly with a congratulatory message with a random dimension: 

<img src="images/carbonator_motivator.png" style="display: block; margin-left: auto; margin-right: auto" width="50%">

Since the scale of savings can vary significantly, the message is constructed using some random elements to keep it meaningful and reduce repetition.

When they click on their username they are taken to Profile page where they can see the total energy they saved and where they stand compared to other users. This page also gives them the possibility to delete incorrect savings. There is an undo function before any saving is permanently deleted.

The app is written in Python -  Django - and Javascript, similar to previous CS50W projects. However, I have used the following technologies extensively for the first time, during the course of developing this project:

- **Git branching and merge** for developing various features, whilst keeping the main app intact

- **Postgres** for back end database rather than default mysql which comes with Django

- **Django tests** for various routes  **Selenium tests** for some pages

- **Github Actions** testing each commit to the master and other branches as needed

- The app is completely containerized using **Docker**. It consists of 2 containers running alongside, one for the website and the other one for the database. Data is saved on a persistent volume which is normally preserved between sessions unless destroyed intentionally

- I also used **CSRF token for fetch PUT and DELETE scripts** which means I did not have to use "CSRF exempt" in the relevant Django routes

- The app is completely responsive thanks to a **media query** converting links on the banner to a hamburger-style menu for smaller screens. All other content scales down in a responsive style thanks to heavy use of **flexbox** in CSS

- I intentionally **avoided using Bootstrap** or similar templates as a challenge to myself, to get better with CSS concepts such as flexbox

## How to run the app:

The instructions here are based on an Ubuntu 20.04 LTS installation with docker and docker-compose installed. Even though it works without problems stand-alone after installing Python 3, it is is much simpler to run the app using docker containers.

After running the command `docker-compose up -d` in capstone directory will install django, python and all other dependencies in 2 docker docker containers, and even populate the database with some dummy data to play around with.

In order to access the app, please visit `http://0.0.0.0:8000` in a browser on the host computer, or indeed from anywhere else on the local network using the ip address of the host computer and port 8000.

The containers and the app can be stopped using `docker-compose down`.

User data saved within the app is persistent in a separate docker volume.

In order to back-up all user and appliance data please issue the following command

```docker exec -e PGPASSWORD="carbonator" postgres_image pg_dump -U carbonator -F p carbonator -h localhost > ./docker/postgres/carbonator.sql```

In order to restore from backup first destroy the data volume by adding `--volumes` at the end of `docker-compose down` command.

Then issue the following command to force Docker to rebuild the postgres container using the carbonator.sql file.

```docker build --no-cache --force-rm -t postgres:latest ./docker/postgres```

Next time you start the application with docker-compose up it should contain the data from back up.

## Security:

This is a development build and therefore does not contain all security features which would be needed for using it in production. For adding/removing users, appliances etc. it is possible to use Django Admin interface with the following credentials.

> 
> django admin username:    superduper
> django admin password:    magnificient

Postgres credentials if needed:

> postgres database:        carbonator
> username:                 carbonator
> password:                 carbonator


## List of files and their contents:

### Docker Compose files
docker-compose.yml

This is the one to build and run the app.


docker-compose-test.yml

For testing on your own computer.


docker-compose-ci.yml

Used by github actions to run tests on the master branch.

### CI/CD GitHub 
.github/workflows/carbonator_tests master.yml:
Builds and run tests on the app first on a virtual machine without docker and then inside docker containers.

### Django Files
HTML Templates

carbonator/templates/carbonator/profile.html:

Page to display savings achieved by logged in users.


carbonator/templates/carbonator/index.html:

Main landing page. Calculates energy saving impact based on criteria given on a form. Allows to "bank" savings for registered users.


carbonator/templates/carbonator/disclaimer.html:

Recommends to take values as a guidance and use own assumptions where applicable.


carbonator/templates/carbonator/layout.html:

Used for common formatting such as header and footer across all pages.


carbonator/templates/carbonator/register.html:

Register new users.


carbonator/templates/carbonator/login.html:

Login existing users.


carbonator/templates/carbonator/settings.html:

Allows users to change some variables such as money units and cost of electricity.


carbonator/templates/carbonator/about.html:

High level overview and purpose of the app.


carbonator/templates/carbonator/halloffame.html:

Shows a list of 10 registered users with the largest amount "banked" energy savings.

Django Models

carbonator/models.py:
- User: Self explanatory
- Appliance: names and typical consumption and usage data for various appliances
- Saving: To store savings for registered users
- Cost: For users who choose their own monetary and environmental cost coefficients

Javascript Files

#carbonator/static/carbonator/halloffame.js
#carbonator/static/carbonator/layout.js
#carbonator/static/carbonator/settings.js
#carbonator/static/carbonator/layout.css
#carbonator/static/carbonator/profile.js
#carbonator/static/carbonator/index.js
These run scripts on the pages with the same name.

carbonator/static/carbonator/styles.css
carbonator/tests.py
.gitignore
docker/website/requirements.txt
docker/website/Dockerfile
docker/postgres/carbonator.sql
docker/postgres/Dockerfile


requirements.txt



## Other information:


- Undo functionality - Decided against 'confirm'
