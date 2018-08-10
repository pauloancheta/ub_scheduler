# Unbounce Scheduler

## TODO
- Create user profiles (possibly a yml)
- Feature 1
  - Get who is away next week and who is on call next week
  - Send an alarm/message to let the team know that there is a mismatch
- Feature 2
  - Get approved timeoff requests
  - Post to Google Calendar

This is a barebones Ruby app using the [Sinatra](http://www.sinatrarb.com) framework.

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org), and [Bundler](http://bundler.io)installed.

```sh
$ cd ub_scheduler
$ bundle
$ ruby app.rb
```

### ENV secrets

To create a secret file for development, create a `env.rb` file and set your secrets in there

```rb
ENV['BAMBOO_API_KEY']     = 'sup3rl33ts3cr3+'
ENV['OPS_GENIE_API_KEY']  = 'sup3rl33ts3cr3+'
```
