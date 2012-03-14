# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end


module PersonName


  # Return true iff the person has a first name and its non-blank

  def first_name?
   respond_to?(:first_name) and first_name and first_name!='' and first_name.strip!=''
  end


  # Return true iff the person has a middle name and its non-blank

  def middle_name?
   respond_to?(:middle_name) and middle_name and middle_name!='' and middle_name.strip!=''
  end


  # Return true iff the person has a last name and its non-blank

  def last_name?
   respond_to?(:last_name) and last_name and last_name!='' and last_name.strip!=''
  end


  # Return the person's first name + middle name
  #
  # ==Example
  #   u.first_name_middle_name => "Martin Luther"

  def first_name_middle_name
    pieces = []
    (pieces << first_name)    if first_name?
    (pieces << middle_name)   if middle_name?
    return pieces.join(' ')
  end


  # Return the person's first name + middle initial
  #
  # ==Example
  #   u.first_name_middle_initial => "Martin N"

  def first_name_middle_initial
    pieces = []
    (pieces << first_name)           if first_name?
    (pieces << middle_name[0...1])   if middle_name?
    return pieces.join(' ')
  end


  # Return the person's first name + middle initial + last name
  #
  # ==Example
  #   u.first_name_middle_initial_last_name => "Martin N King"

  def first_name_middle_initial_last_name
   pieces = []
    (pieces << first_name)           if first_name?
    (pieces << middle_name[0...1])   if middle_name?
    (pieces << last_name)            if last_name?
    return pieces.join(' ')
  end


  # Return the person's full name: first_name middle_name last_name
  #
  # ==Example
  #   u.full_name => "Martin Luther King"
  #
  # This method skips any piece of the name that is missing or blank.

  def full_name
    pieces = []
    (pieces << first_name)     if first_name?
    (pieces << middle_name)    if middle_name?
    (pieces << last_name)      if last_name?
    return pieces.join(' ')
  end


  # Return the person's list name: last_name, first_name middle_name
  #
  # ==Example
  #   u.list_name => "King, Martin Luther"
  #
  # This method skips any piece of the name that is missing or blank.

  def list_name
    pieces = []
    (pieces << first_name)  if first_name?
    (pieces << middle_name) if middle_name?
    if last_name?
      comma = pieces.size>0 ? ',' : ''
      pieces.unshift(last_name+comma)
    end
    return pieces.join(' ')
  end


  # Return the person's intials
  #
  # ==Example
  #   u.initials => "MLK"
  #
  # This method skips any piece of the name that is missing or blank.

  def initials
    s = ""
    (s << first_name[0])  if first_name?
    (s << middle_name[0]) if middle_name?
    (s << last_name[0]) if last_name?
    return s
  end


end
