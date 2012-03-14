# SixArm.com » Ruby » <br> PersonName gem accesses a person's name from ActiveRecord fields

* Docs: <http://sixarm.com/sixarm_ruby_person_name/doc>
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


## Quickstart

Install:

    gem install sixarm_ruby_person_name

Bundler:

    gem "sixarm_ruby_person_name", "=1.0.4"

Require:

    require "sixarm_ruby_person_name"


## Example

Create a typical user class, include this mixin, the use it:

    require "sixarm_ruby_person_name"

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


## Performance Tip

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


