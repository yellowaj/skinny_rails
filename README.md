# SkinnyRails

Put your Rails app on a diet. This is a very simple Rails generator to remove unnecessary dependencies from your app for basic "static" sites.

## Installation

Add gem to Gemfile:

	gem 'skinny_rails', require: false

Install via bundler:

	 $ bundle install

And then from your existing Rails4 app, run:

	$ rails generate skinny_rails

## Explanation

The included generator will perform the following tasks:

* Only load the following Railties:
	* action_controller
	* rails/test_unit
	* sprockets
* Remove unnecessary files/folders:
	* config/data.yml
	* db/seeds.rb
	* db/schema.rb
	* app/mailers
	* test/mailers
* Comment-out database gems from Gemfile
* Disable any config settings from now-missing modules
* Remove session/cookie middleware

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
