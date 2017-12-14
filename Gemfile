source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>5.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use devise for authentication
gem 'devise', '~> 4.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Full calendar
gem 'fullcalendar-rails'
gem 'momentjs-rails'
# bootstrap, javascript stuffs
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'bootstrap-datepicker-rails' # For showing calender in date fields
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# chart
gem 'chartkick', '~> 2.2.0'
gem 'groupdate'

gem 'redis-rails', '~> 5.0', '>= 5.0.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

end

# production
gem 'capistrano', '~> 3.7', '>= 3.7.1'
gem 'capistrano-rails', '~> 1.2'
gem 'capistrano-passenger', '~> 0.2.0'

# Add this if you're using rbenv
gem 'capistrano-rbenv', '~> 2.1'

gem 'petergate', '~> 1.7', '>= 1.7.5'

ruby '2.4.2'
