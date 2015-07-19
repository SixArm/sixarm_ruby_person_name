# SixArm.com » Ruby » <br> PersonName mixin methods for a person model

<!--HEADER-OPEN-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_person_name.svg)](http://badge.fury.io/rb/sixarm_ruby_person_name)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_person_name.png)](https://travis-ci.org/SixArm/sixarm_ruby_person_name)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_person_name.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_person_name)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_person_name/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_person_name?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_person_name>
* Doc: <http://sixarm.com/sixarm_ruby_person_name/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_person_name>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Changes: See CHANGES.md file.
* License: See LICENSE.md file.
* Helping: See CONTRIBUTING.md file.

<!--HEADER-SHUT-->


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


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_person_name", ">= 1.1.2", "< 2"

To install using the command line, run this:

    gem install sixarm_ruby_person_name -v ">= 1.1.2, < 2"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_person_name -v ">= 1.1.2, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_person_name"

<!--INSTALL-SHUT-->


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
