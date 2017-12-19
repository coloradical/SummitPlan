# SummitPlan
The go-to website for planning your next 14er adventure!

## Team Name
The Mountaineers

## Team Members
[Megan Byers](https://github.com/coloradical), [Lucas Reed](https://github.com/lure7991), [Lindsay Walton](https://github.com/lawalton) & [Elliot Whitehead](https://github.com/elliotwhitehead)

## Description
Summit Plan is a website that allows you to enter criteria to find the perfect 14er (or hiking trails depending on how much effort we want to put in this) to hike.
* Enter criteria like hike length, skill level, distance from home and more to help you choose the best 14er to climb
* Aggregates weather averages from past years to determine when it's safest to be on that particular mountain
* Live weather updates
* Traffic and directions from Google Maps
* Data page describing the basics of each 14er (round trip length, photos, trailhead name, coordinates, lakes and streams nearby, snow pack information and any other relevant info
* Download information offline
* Tracks which 14ers or trails you've completed, along with your summit time
* Overall interactive map showing where all the 14ers are

## File Structure
Most of our app was setup and organized by the Ruby on Rails installation.

Two files hold the main html source for the project:

Main Homepage: [app/views/fourteeners/index.html.erb](app/views/fourteeners/index.html.erb)

Fourteener Specific Page: [app/views/fourteeners/show.html.erb](app/views/fourteeners/show.html.erb)

Both of these files inherit structure from the application html page found at: [app/views/layouts/application.html.erb](app/views/layouts/application.html.erb)

Our **milestone documents** can be found in [docs/milestones](docs/milestones)


## Installation
You can easily install and set up this project thanks to containerization from [Docker](https://docker.com)!


[Tip]: You'll need internet to source various dependencies to build the project, so a speedy internet connection will make this go smoother!

1. Install Docker (Stable Channel) ([MacOS](https://docs.docker.com/docker-for-mac/install/), [Windows](https://docs.docker.com/docker-for-windows/install/)). During installation, you'll have the option to have the Docker Daemon boot with your operating system, and be available in the background, or elect to boot the Docker Daemon manually. The Docker daemon([?](https://en.wikipedia.org/wiki/Daemon_(computing))) needs to be running whenever you interact with Docker, so keep that in mind.
    * I know what you're thinking: `"I have to download install something? Wasn't the point to avoid downloading / dealing with a VM?"` To which, I say: Not quite! The best part about Docker is the way it lets all of us teammates work on an identical environment to what is on production!
2. Once the Docker daemon is up and running, simply navigate to the SummitPlan project directory (where the `Dockerfile` and `docker-compose.yml` files are) in the terminal, and run: `docker-compose build`
    * Docker will then run off and pull down images (dependencies) required from the [Dockerfile](https://docs.docker.com/engine/reference/builder/), and build a web server and database image to run the app, based on the specifications of the docker-compose.yml file.
3. Great! You now have a Docker 'image' built. An image is essentially a bluebrint, or an _idea_ of the web app that we want to have. To bring an image to life, we have to **_run_** the image, creating a **_container_**!
4. To compose the web app (and in the process, two containers - one for the RoR web server, and another for the Postgres db) simply run: `docker-compose up`
    * Your terminal should go crazy as Docker lights up the two containers and tails the process logs to your terminal.
    * You should now be able to visit [http://localhost:3000](http://localhost:3000) and seeeee `an error!`
    * As you can see by the ActiveRecord error `NoDatabaseError`, Rails is unhappy with our database configuration. That's because while we have a Postgres process up and running, we haven't initialized the actual database yet.
5. Open another terminal window, navigate to the project directory, and gracefully stop the app with `docker-compose stop`
    * **_[IMPORTANT NOTE]:_** When your terminal is attached to the docker process, (i.e. you are seeing terminal logs output from the Rails and Postgres processes) do not use `ctrl+c` to stop the processes. Doing so _may_ cause an error the next time you run `docker-compose up` - If you ever get an error that reads `A server is already running. Check /myapp/tmp/pids/server.pid`, delete the file at `/tmp/pids/server.pid`, and run `docker-compose up` again.
6. A quick peek at the file `/config/database.yml` file shows that Rails is looking for two databases: `summitplan_development` and `summitplan_test`, as well as a database user, `postgresql`. To create them, we'll use a Ruby build tool called [Rake](https://en.wikipedia.org/wiki/Rake_(software)) (comes built-in with Rails). To create the databases, run `docker-compose run web rake db:create`
    * An anatomy of the command you just ran:
      * `docker-compose run`: used to run a command against a docker-compose service
      * `web`: the service to run the command against. `web` is the Rails web server described (and named 'web') in the docker-compose.yml file
      * `rake db:create`: a ruby command which uses Rake to build and create our database, as described in the `config/database.yml` file
7. Now you need to initialize the database with all of the appropriate columns to match our data model. To do so, run: 
```shell 
docker-compose run web rails db:migrate
```
8. Finally, to populate the databse with all of the fourteeners and an admin user, run: 
```shell
docker-compose run web rails db:seed
```
9. Now, run `docker-compose up` again, and it should boot up with no problems!
10. Hooray! You're done!
