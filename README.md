# Omniauth Ning

This is an OmniAuth strategy for authenticating to Ning. To use it, you'll need to have an OAuth Consumer Key and Consumer Secret on your respective Ning application. See the [Ning API documentation](http://developer.ning.com/docs/ningapi/1.0/index.html) for more information.

## Basic Rails Usage

In your `Gemfile`:

    gem 'omniauth-ning', github: 'bignerdranch/omniauth-ning'

Then add an in our Omniauth initializer add:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :ning, ENV['OAUTH_CONSUMER_KEY'], ENV['OAUTH_CONSUMER_SECRET']
    end

And add the callback route to your `routes.rb`:

    get '/auth/:provider/callback', to: 'sessions#create'


Finally implement the `sessions#create` endpoint or whatever endpoint you decide to point the callback to setup your user's session.


## Development

New features or bug fixes are accepted via Pull Requests on GitHub. Please add test coverage for bugs and features and be sure the test suite is passing by running the tests:

    bundle exec rspec

## License

Copyright (c) 2013 Big Nerd Ranch.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.