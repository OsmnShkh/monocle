## eevents

eevents is a link and news aggregation website for event planners based on monocle.io by Alex MacCaw



![Screenshot](http://maccman.github.io/eevents/screenshot.png)

### Prerequisites

* Ruby 2.0
* Postgres 9.3
* Redis
* A GitHub app account
* A Twitter app account

### Setup

    bundle install
    createdb eevents_development
    rake db:migrate

    export GITHUB_KEY=123
    export GITHUB_SECRET=123

    export TWITTER_KEY=123
    export TWITTER_SECRET=123

    thin start