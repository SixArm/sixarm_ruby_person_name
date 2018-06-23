# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

module PersonName

  ###
  #
  # Boolean methods
  #
  ###

  # Does the person have a given name?
  #
  # Example:
  #
  #    user.given_name = "Martin"
  #    user.given_name?
  #    => true
  #
  # @return true iff the person has a given name and its non-blank.
  #
  def given_name?
    !!(respond_to?(:given_name) && given_name && given_name!='' && given_name.strip!='')
  end

  # Does the person have a first name?
  #
  # Example:
  #
  #    user.first_name = "Martin"
  #    user.first_name?
  #    => true
  #
  # @return true iff the person has a first name and its non-blank.
  #
  def first_name?
    !!(respond_to?(:first_name) && first_name && first_name!='' && first_name.strip!='')
  end

  # Does the person have a middle name?
  #
  # Example:
  #
  #    user.middle_name = "Luther"
  #    user.middle_name?
  #    => true
  #
  # @return true iff the person has a middle name and its non-blank.
  #
  def middle_name?
    !!(respond_to?(:middle_name) && middle_name && middle_name!='' && middle_name.strip!='')
  end

  # Does the person have a family name?
  #
  # Example:
  #
  #    user.family_name = "King"
  #    user.family_name?
  #    => true
  #
  # @return true iff the person has a family name and its non-blank.
  #
  def family_name?
    !!(respond_to?(:family_name) && family_name && family_name!='' && family_name.strip!='')
  end

  # Does the person have a last name?
  #
  # Example:
  #
  #    user.last_name = "King"
  #    user.last_name?
  #    => true
  #
  # Return true iff the person has a last name and its non-blank.
  #
  def last_name?
    !!(respond_to?(:last_name) && last_name && last_name!='' && last_name.strip!='')
  end

  ###
  #
  # Concatenation methods
  #
  ###
  
  # Get the person's full name.
  #
  # Example:
  #
  #     user.full_name => "Martin Luther King"
  #
  # This method skips any piece of the name that is missing or blank.
  #
  # @return the person's full name
  #
  def full_name
    pieces = []
    if given_name?
      pieces << given_name
    elsif first_name?
      pieces << first_name
    end
    if middle_name?
      pieces << middle_name
    end
    if family_name?
      pieces << family_name
    elsif last_name?
      pieces << last_name
    end
    return pieces.join(' ')
  end

  # Get the person's list name.
  #
  # Example:
  #
  #     user.list_name => "King, Martin Luther"
  #
  # This method skips any piece of the name that is missing or blank.
  #
  # @teturn the person's list name
  #
  def list_name
    left_pieces = []
    right_pieces = []
    if family_name?
      left_pieces << family_name
    elsif last_name?
      left_pieces << last_name
    end
    if given_name?
      right_pieces << given_name
    elsif first_name?
      right_pieces << first_name
    end
    if middle_name?
      right_pieces << middle_name
    end
    return left_pieces.join(' ') + (!left_pieces.empty? && !right_pieces.empty? ? ", " : '') + right_pieces.join(' ')
  end

  # Get the person's intials
  #
  # Example:
  #
  #     user.initials => "MLK"
  #
  # This method skips any piece of the name that is missing or blank.
  #
  # @return the person's intials
  #
  def initials
    s = ""
    if given_name?
      s << given_name[0]
    elsif first_name?
      s << first_name[0]
    end
    if middle_name?
      s << middle_name[0]
    end
    if family_name?
      s << family_name[0]
    elsif last_name?
      s << last_name[0]
    end
    return s
  end

  # Get the person's given name + middle name
  #
  # Example:
  #
  #     user.given_name_middle_name => "Martin Luther"
  #
  # @return the person's given name + middle name
  #
  def given_name_middle_name
    pieces = []
    (pieces << given_name)    if given_name?
    (pieces << middle_name)   if middle_name?
    return pieces.join(' ')
  end

  # Get the person's first name + middle name
  #
  # Example:
  #
  #    user.first_name_middle_name => "Martin Luther"
  #
  # @return the person's first name + middle name
  #
  def first_name_middle_name
    pieces = []
    (pieces << first_name)    if first_name?
    (pieces << middle_name)   if middle_name?
    return pieces.join(' ')
  end

  # Get the person's given name + middle initial
  #
  # Example:
  #
  #     user.first_name_middle_initial => "Martin L"
  #
  # @return the person's given name + middle initial
  #
  def given_name_middle_initial
    pieces = []
    (pieces << given_name)           if given_name?
    (pieces << middle_name[0...1])   if middle_name?
    return pieces.join(' ')
  end

  # Get the person's first name + middle initial
  #
  # Example:
  #
  #     user.first_name_middle_initial => "Martin L"
  #
  # @return the person's first name + middle initial
  #
  def first_name_middle_initial
    pieces = []
    (pieces << first_name)           if first_name?
    (pieces << middle_name[0...1])   if middle_name?
    return pieces.join(' ')
  end

  # Get the person's given name + middle initial + family name
  #
  # Example:
  #
  #     user.given_name_middle_initial_family_name => "Martin L King"
  #
  # @return the person's given name + middle initial + family name
  #
  def given_name_middle_initial_family_name
   pieces = []
    (pieces << given_name)           if given_name?
    (pieces << middle_name[0...1])   if middle_name?
    (pieces << family_name)          if family_name?
    return pieces.join(' ')
  end

  # Get the person's first name + middle initial + last name
  #
  # Example:
  #
  #     u.first_name_middle_initial_family_name => "Martin N King"
  #
  # @return the person's first name + middle initial + last name
  #
  def first_name_middle_initial_last_name
   pieces = []
    (pieces << first_name)           if first_name?
    (pieces << middle_name[0...1])   if middle_name?
    (pieces << last_name)            if last_name?
    return pieces.join(' ')
  end

end
