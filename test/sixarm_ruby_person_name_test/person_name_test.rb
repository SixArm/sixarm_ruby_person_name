# -*- coding: utf-8 -*-
require "sixarm_ruby_person_name_test"

describe PersonName do

  include PersonName

  before do
    F   ||= Person.new("abc",   nil,   nil)  # First name
    M   ||= Person.new(  nil, "def",   nil)  # Middle name
    L   ||= Person.new(  nil,   nil, "ghi")  # Last name
    FM  ||= Person.new("abc", "def",   nil)  # First name & Middle name
    FL  ||= Person.new("abc",   nil, "ghi")  # First name & Last name
    ML  ||= Person.new(  nil, "def", "ghi")  # Middle name & Last name
    FML ||= Person.new("abc", "def", "ghi")  # First name & Middle name & Last name
  end

  describe "#first_name_middle_name" do 

    it "with first" do
      F.first_name_middle_name.must_equal("abc")
    end

    it "with middle" do
      M.first_name_middle_name.must_equal("def")
    end

    it "with last" do
      L.first_name_middle_name.must_equal("")
    end
    
    it "with first & middle" do
      FM.first_name_middle_name.must_equal("abc def")
    end

    it "with first & last" do
      FL.first_name_middle_name.must_equal("abc")
    end

    it "with middle & last" do
      ML.first_name_middle_name.must_equal("def")
    end

    it "with first & middle & last" do
      FML.first_name_middle_name.must_equal("abc def")
    end

  end

  describe "#first_name_middle_initial" do

    it "with first" do 
      F.first_name_middle_initial.must_equal("abc")
    end

    it "with middle" do 
      M.first_name_middle_initial.must_equal("d")
    end

    it "with last" do
      L.first_name_middle_initial.must_equal("")
    end

    it "with first & middle" do 
      FM.first_name_middle_initial.must_equal("abc d")
    end

    it "with first & last" do
      FL.first_name_middle_initial.must_equal("abc")
    end

    it "with middle & last" do
      ML.first_name_middle_initial.must_equal("d")
    end

    it "with first & middle & last" do 
      FML.first_name_middle_initial.must_equal("abc d")
    end
    
  end
  
  describe "#first_name_middle_initial_last_name" do

    it "with first" do
      F.first_name_middle_initial_last_name.must_equal("abc")
    end

    it "with middle" do
      M.first_name_middle_initial_last_name.must_equal("d")
    end

    it "with last" do
      L.first_name_middle_initial_last_name.must_equal("ghi")
    end

    it "with first &_middle" do
      FM.first_name_middle_initial_last_name.must_equal("abc d")
    end

    it "with first &_last" do
      FL.first_name_middle_initial_last_name.must_equal("abc ghi")
    end

    it "with middle &_last" do
      ML.first_name_middle_initial_last_name.must_equal("d ghi")
    end

    it "with first & middle &_last" do
      FML.first_name_middle_initial_last_name.must_equal("abc d ghi")
    end

  end

  describe "#full_name" do

    it "with first" do
      F.full_name.must_equal("abc")
    end

    it "with middle" do
      M.full_name.must_equal("def")
    end
    
    it "with last" do
      L.full_name.must_equal("ghi")
    end

    it "with first & middle" do
      FM.full_name.must_equal("abc def")
    end

    it "with first & last" do
      FL.full_name.must_equal("abc ghi")
    end

    it "with middle & last" do
      ML.full_name.must_equal("def ghi")
    end

    it "with first & middle & last" do
      FML.full_name.must_equal("abc def ghi")
    end

  end

  describe "#list_name" do

    it "with first" do
      F.list_name.must_equal("abc")
    end

    it "with middle" do
      M.list_name.must_equal("def")
    end

    it "with last" do
      L.list_name.must_equal("ghi")
    end

    it "with first & middle" do 
      FM.list_name.must_equal("abc def")
    end

    it "with first & last" do
      FL.list_name.must_equal("ghi, abc")
    end

    it "with middle & last" do
      ML.list_name.must_equal("ghi, def")
    end

    it "with first & middle & last" do
      FML.list_name.must_equal("ghi, abc def")
    end

  end

  describe "#initials" do
    
    it "with first" do
      F.initials.must_equal("a")
    end

    it "with middle" do
      M.initials.must_equal("d")
    end

    it "with last" do
      L.initials.must_equal("g")
    end

    it "with first & middle" do
      FM.initials.must_equal("ad")
    end

    it "with first & last" do
      FL.initials.must_equal("ag")
    end

    it "with middle & last" do
      ML.initials.must_equal("dg")
    end

    it "with first & middle & last" do
      FML.initials.must_equal("adg")
    end

  end

end


class Person

 attr_accessor :first_name
 attr_accessor :middle_name
 attr_accessor :last_name

 include PersonName

 def initialize(first,middle,last)
  @first_name=first
  @middle_name=middle
  @last_name=last
 end

end
