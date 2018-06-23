# SixArm.com → Ruby → <br> PersonName mixin methods for a person model

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_person_name.svg)](http://badge.fury.io/rb/sixarm_ruby_person_name)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_person_name.png)](https://travis-ci.org/SixArm/sixarm_ruby_person_name)
[![Code Climate](https://api.codeclimate.com/v1/badges/a895fd425b0fec86bfb1/maintanability)](https://codeclimate.com/github/SixArm/sixarm_ruby_person_name/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_person_name>
* Doc: <http://sixarm.com/sixarm_ruby_person_name/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_person_name>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

Our user models typically have accessors like these:

   user.given_name => "Martin"
   user.middle_name => "Luther"
   user.family_name => "King"

This gem is a utility to concatenate the user's name various common ways:

   user.full_name => "Martin Luther King"
   user.list_name => "King, Martin Luther"
   user.initials => "MLK"

It's fine if the model doesn't have a middle_name field, or if any of the values of any of the fields are nil or blank; this gem will do the right thing.

For docs go to <http://sixarm.com/sixarm_ruby_person_name/doc>

Want to help? We're happy to get pull requests.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_person_name

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_person_name'

### Require

To require the gem in your code:

    require 'sixarm_ruby_person_name'

<!--install-shut-->


## Example

Create a typical user class, include this mixin, the use it:

    class User < ActiveRecord::Base
      include PersonName
    end

    user = User.new(
      given_name => 'Martin',
      middle_name => 'Luther',
      family_name => 'King'
    )

    user.full_name => "Martin Luther King"
    user.list_name => "King, Martin Luther"
    user.initials => "MLK"
    user.given_name_middle_name => "Martin Luther"
    user.given_name_middle_initial => "Martin L"
    user.given_name_middle_initial_family_name => "Martin L King"


## Naming conventions

You can use either of these naming conventions:

  * given name, middle name, family name
  * first name, middle name, last name


## Speed Tip

To make these very fast in Rails, you can use memoize:

    class User < ActiveRecord::Base
      extend ActiveSupport::Memoizable
      include PersonName
      memoize :full_name,
              :list_name,
              :initials,
              :given_name_middle_name,
              :given_name_middle_initial,
              :given_name_middle_initial_family_name,
              :given_name_family_name
    end
