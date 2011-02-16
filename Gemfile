source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem "bundler", "~> 1.0.10"
  gem "jeweler", "~> 1.5.2"
  gem "rcov", ">= 0.9.9"
end

group :test do
  gem "shoulda"
end

platforms :jruby do
  gem "ruby-debug", ">= 0.10.3"

#  gem "activerecord-jdbcsqlite3-adapter"

  # This is needed by now to let tests work on JRuby
  # TODO: When the JRuby guys merge jruby-openssl in
  # jruby this will be removed
  gem "jruby-openssl"

#  group :db do
#    gem "activerecord-jdbcmysql-adapter"
#    gem "activerecord-jdbcpostgresql-adapter"
#  end
  
#  gem "rawr"
#  gem "log4r"
end