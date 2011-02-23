= fumoffu

Description goes here.

I just started a month ago so the whole thing is still pretty fresh :).

== Environment

Make sure you have your JRuby environment loaded, or configure your IDE to points to your jruby installation

On a terminal
-------------
To load your JRuby environment in a terminal just make a quick export
```sh
export PATH=/your/local/path/jruby-X.X.X/bin:$PATH
```

Installation
============

New project install the gem.
Then create a new project
```sh
mkdir MyApp
cd MyApp
fumoffu -i
```

# Compile the java source and generate the jar that will contain the view

Packaging
=========

To package your application first you need to create a jar of all the bundled
```sh
bundle install lib/ruby
rake pkg:rawr:bundle_jar
rake rawr:jar
rake rawr:bundle_app
```

Then configure the rake file in config/tasks/package.rake


= Jar dependencies

swing-layout => 1.0.4

