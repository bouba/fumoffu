source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.

platforms :jruby do
  gem "ruby-debug", ">= 0.10.3"

  #  gem "activerecord-jdbcsqlite3-adapter"

  group :development do
    gem "bundler", "~> 1.0.10"
    gem "jeweler", "~> 1.5.2"
  end
  # This is needed by now to let tests work on JRuby
  # TODO: When the JRuby guys merge jruby-openssl in
  # jruby this will be removed
  gem "jruby-openssl"

  group :test do
    gem "rcov", ">= 0.9.9"
    gem "shoulda"
  end
  #  group :db do
  #    gem "activerecord-jdbcmysql-adapter"
  #    gem "activerecord-jdbcpostgresql-adapter"
  #  end

  #  gem "rawr"
  #  gem "log4r"
end