# Ruby » <br> PersonName mixin methods for a person model

* Doc: <http://sixarm.com/sixarm_ruby_person_name/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_person_name>
* Repo: <http://github.com/sixarm/sixarm_ruby_person_name>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Our user models typically have accessors like these:

   user.first_name => "Martin"
   user.middle_name => "Luther"
   user.last_name => "King"

This gem is a utility to concatenate the user's name various common ways:

   user.full_name => "Martin Luther King"
   user.list_name => "King, Martin Luther"
   user.initials => "MLK"

It's fine if the model doesn't have a middle_name field, or if any of the values of any of the fields are nil or blank; this gem will do the right thing.

For docs go to <http://sixarm.com/sixarm_ruby_person_name/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_person_name

Bundler:

    gem "sixarm_ruby_person_name", "~>1.1.0"

Require:

    require "sixarm_ruby_person_name"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_person_name --trust-policy HighSecurity


## Example

Create a typical user class, include this mixin, the use it:

    class User < ActiveRecord::Base
      include PersonName
    end

    user=User.new(
      first_name => 'Martin',
      middle_name => 'Luther',
      last_name => 'King'
    )

    user.full_name => "Martin Luther King"
    user.list_name => "King, Martin Luther"
    user.initials => "MLK"
    user.first_name_middle_name => "Martin Luther"
    user.first_name_middle_initial => "Martin L"
    user.first_name_middle_initial_last_name => "Martin L King"


## Speed Tip

To make these very fast in Rails, you can use memoize:

    class User < ActiveRecord::Base
      extend ActiveSupport::Memoizable
      include PersonName
      memoize :full_name,
              :list_name,
              :initials,
              :first_name_middle_name,
              :first_name_middle_initial,
              :first_name_middle_initial_last_name,
              :first_name_last_name
    end


## Changes

* 2012-03-24 1.1.0 Upgrade for Ruby 1.9.3, minitest/spec, and improved docs.
* 2012-01-24 1.0.4 Add #initals method. Add CHANGELOG.txt file. Update examples.


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
