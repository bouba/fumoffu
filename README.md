# Fumoffu

Lionel Abderemane aka Bouba

http://github.com/bouba/fumoffu

I just started a month ago so the whole thing is still pretty fresh and VERY unstable ^_^.

So I hope you will be able to enjoy it. I will try may best documenting the project progressively.

## Description

Fumoffu is a [JRuby][jruby] / Java Swing Framework which enabling users to easily design and create crossplatform desktop application.

**The framework goal primary goals are:**

* Develop a cross-platform UI (Windows, OSX, Linux)
* Easily and quickly package and deploy the application
* Easily setup the development environment

You can see a tutorial of a sample application made with this framework [here](http://github.com/bouba/fumoffu_example).


* * *

## Installation

-   **Setup your [JRuby][jruby] environment**

    _First download and install [JRuby][jruby] if do not have it_  
__On a terminal__  
To load your [JRuby][jruby] environment in a terminal just make a quick export  

      export PATH=/your/local/path/jruby-X.X.X/bin:$PATH

-   **Download and setup the Fumoffu gem**

    _Since I still did put the gem on ruby forge to install it you to download and generate the gem manually to install it_  


        git clone git://github.com/bouba/fumoffu.git
        cd fumoffu
        bundle install
        rake install
        cd pkg
        gem i fumoffu-0.0.1.gem --local


-   **Setup your project files**

    New project install the gem.  
Then create a new project

      mkdir MyApp
      cd MyApp
      fumoffu -i

   Switch the boolean in the rake file to enable the rawr tasks then execute

      rake rawr:get:current-stable-jruby

-   **Setup your IDE**

    Currently this step is still in my opinion it is still way too complicated to do.  
(I personally use Netbeans.)  

    Here is the basic idea of how I setup my development environment.  
I create 2 Projects:  
  
    * A Java Project
    * A Ruby Project (where I switch the compiler to JRuby and add the root folder to the sources to be 
    able to access to my Rake tasks using my IDE)  
  
_I think will make a video or something regarding the IDE setup, until I script the setup._


* * *
## Packaging

To package your application first you need to create a jar of all the bundled


    bundle install lib/ruby
    rake pkg:rawr:bundle_jar
    rake rawr:jar
    rake rawr:bundle:app


Then configure the rake file in config/tasks/package.rake

[jruby]: http://jruby.org/download "[JRuby][jruby]"