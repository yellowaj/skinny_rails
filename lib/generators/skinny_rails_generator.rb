require 'rails/generators'

class SkinnyRailsGenerator < Rails::Generators::Base
	desc 'This generator puts your Rails app on a diet.'
  
  def add_new_railties
		insert_into_file 'config/application.rb', after: "require 'rails/all'" do 
%q(
%w( action_controller rails/test_unit sprockets ).each do |framework|
	begin
		require "#{framework}/railtie"
	rescue LoadError
	end
end )
		end
	end

	def comment_out_all_railties
		comment_lines 'config/application.rb', /require 'rails\/all'/
	end

	def remove_unnecessary_files
		%w( 
			config/database.yml
			db/schema.rb
			db/seeds.rb
			app/mailers 
		).each do |file|
			remove_file file
		end
	end

	def comment_out_database_gems
		comment_lines 'Gemfile', /(gem 'pg'|mysql|sqlite)/
	end

	def comment_out_configurations
		comment_lines 'config/environments/development.rb', /(action_mailer|active_record)/i
		comment_lines 'config/environments/test.rb', /(action_mailer|active_record)/i
		comment_lines 'test/test_helper.rb', /(fixtures|ActiveRecord)/i
	end

	def delete_cookie_middleware
		application do
		%q(
		config.middleware.delete "ActionDispatch::Cookies"
		config.middleware.delete "ActionDispatch::Session::CookieStore"
		config.middleware.delete "ActionDispatch::Flash" 
		)
		end	
	end
end
