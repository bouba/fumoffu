# Fumoffu

Lionel Abderemane aka Bouba

http://github.com/bouba/fumoffu

The current version of fumoffu has changed quite a bit. It is still "fresh" but I believe that the structure
is much better and easier to understand. I still have not found a satisfactory way to run the tests. 

But I think I manage to improve the way the application is packaged.

Fumoffu is now released as a gem. So you may find it on [Rubygem](https://rubygems.org/gems/fumoffu) website

So I hope you will be able to enjoy it.

## Description

Fumoffu is a [JRuby][jruby] / Java Swing Framework which enabling users to easily design and create crossplatform desktop application.

**The framework goal primary goals are:**

* Develop a cross-platform UI (Windows, OSX, Linux)
* Easily and quickly package and deploy the application
* Easily setup the development environment

You can see a tutorial of a sample application made with this framework [here](http://github.com/bouba/fumoffu_example).


* * *

## Installation

### From gem

    gem i fumoffu

### From sources

**Setup your [JRuby][jruby] environment**

First download and install [JRuby][jruby] if do not have it

__On a terminal__  

To load your [JRuby][jruby] environment in a terminal just make a quick export  

      export PATH=/your/local/path/jruby-X.X.X/bin:$PATH

Download and setup the Fumoffu gem

    _Since I still did put the gem on ruby forge to install it you to download and generate the gem manually to install it_  


        git clone git://github.com/bouba/fumoffu.git
        cd fumoffu
        bundle install
        rake install
        cd pkg
        gem i fumoffu-0.1.0.gem --local


* * *

Tutorial to setup your project are available [here](http://github.com/bouba/fumoffu_example).
[jruby]: http://jruby.org/download "[JRuby][jruby]"