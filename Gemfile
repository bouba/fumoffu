source "http://rubygems.org"

platforms :jruby do
  gem "bundler", "~> 1.0.10"

  #  gem "activerecord-jdbcsqlite3-adapter"

  group :development do
    gem "ruby-debug", ">= 0.10.3"
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
end