# ruby-sample

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
ENV["MY_SUPER_SECRET_KEY"] = sup3rl33ts3cr3+
```
