# -*- coding: utf-8 -*-
require "sixarm_ruby_person_name_test"

describe PersonName do

  include PersonName

  describe "boolean methods" do

    before do
      @p = Person.new
    end

    describe "#given_name?" do
      it "works" do
        expect(@p.given_name?).must_be_same_as false
        @p.given_name = "x"
        expect(@p.given_name?).must_be_same_as true
      end
    end

    describe "#first_name?" do
      it "works" do
        expect(@p.first_name?).must_be_same_as false
        @p.first_name = "x"
        expect(@p.first_name?).must_be_same_as true
      end
    end

    describe "#middle_name?" do
      it "works" do
        expect(@p.middle_name?).must_be_same_as false
        @p.middle_name = "x"
        expect(@p.middle_name?).must_be_same_as true
      end
    end

    describe "#family_name?" do
      it "works" do
        expect(@p.family_name?).must_be_same_as false
        @p.family_name = "x"
        expect(@p.family_name?).must_be_same_as true
      end
    end

    describe "#last_name?" do
      it "works" do
        expect(@p.last_name?).must_be_same_as false
        @p.last_name = "x"
        expect(@p.last_name?).must_be_same_as true
      end
    end

  end
  
  describe "concatenation methods" do

    before do
      GIVEN               ||= Person.new(given_name: "Given")
      FIRST               ||= Person.new(first_name: "First")
      MIDDLE              ||= Person.new(middle_name: "Middle")
      FAMILY              ||= Person.new(family_name: "Family")
      LAST                ||= Person.new(last_name: "Last")
      GIVEN_MIDDLE        ||= Person.new(given_name: "Given", middle_name: "Middle")
      FIRST_MIDDLE        ||= Person.new(first_name: "First", middle_name: "Middle")
      GIVEN_FAMILY        ||= Person.new(given_name: "Given", family_name: "Family")
      FIRST_LAST          ||= Person.new(first_name: "First", last_name: "Last")
      MIDDLE_FAMILY       ||= Person.new(middle_name: "Middle", family_name: "Family")
      MIDDLE_LAST         ||= Person.new(middle_name: "Middle", last_name: "Last")
      GIVEN_MIDDLE_FAMILY ||= Person.new(given_name: "Given", middle_name: "Middle", family_name: "Family")
      FIRST_MIDDLE_LAST   ||= Person.new(first_name: "First", middle_name: "Middle", last_name: "Last")    
    end

    describe "#full_name" do

      it "with given" do
        GIVEN.full_name.must_equal("Given")
      end

      it "with first" do
        FIRST.full_name.must_equal("First")
      end

      it "with middle" do
        MIDDLE.full_name.must_equal("Middle")
      end
      
      it "with family" do
        FAMILY.full_name.must_equal("Family")
      end

      it "with last" do
        LAST.full_name.must_equal("Last")
      end

      it "with given & middle" do
        GIVEN_MIDDLE.full_name.must_equal("Given Middle")
      end

      it "with first & middle" do
        FIRST_MIDDLE.full_name.must_equal("First Middle")
      end

      it "with given & family" do
        GIVEN_FAMILY.full_name.must_equal("Given Family")
      end

      it "with first & last" do
        FIRST_LAST.full_name.must_equal("First Last")
      end

      it "with middle & family" do
        MIDDLE_FAMILY.full_name.must_equal("Middle Family")
      end

      it "with middle & last" do
        MIDDLE_LAST.full_name.must_equal("Middle Last")
      end

      it "with given & middle & family" do
        GIVEN_MIDDLE_FAMILY.full_name.must_equal("Given Middle Family")
      end

      it "with first & middle & last" do
        FIRST_MIDDLE_LAST.full_name.must_equal("First Middle Last")
      end

    end

    describe "#list_name" do

      it "with given" do
        GIVEN.list_name.must_equal("Given")
      end

      it "with first" do
        FIRST.list_name.must_equal("First")
      end

      it "with middle" do
        MIDDLE.list_name.must_equal("Middle")
      end

      it "with family" do
        FAMILY.list_name.must_equal("Family")
      end

      it "with last" do
        LAST.list_name.must_equal("Last")
      end

      it "with given & middle" do 
        GIVEN_MIDDLE.list_name.must_equal("Given Middle")
      end

      it "with first & middle" do 
        FIRST_MIDDLE.list_name.must_equal("First Middle")
      end

      it "with given & family" do
        GIVEN_FAMILY.list_name.must_equal("Family, Given")
      end

      it "with first & last" do
        FIRST_LAST.list_name.must_equal("Last, First")
      end

      it "with middle & family" do
        MIDDLE_FAMILY.list_name.must_equal("Family, Middle")
      end

      it "with middle & last" do
        MIDDLE_LAST.list_name.must_equal("Last, Middle")
      end

      it "with given & middle & family" do
        GIVEN_MIDDLE_FAMILY.list_name.must_equal("Family, Given Middle")
      end

      it "with first & middle & last" do
        FIRST_MIDDLE_LAST.list_name.must_equal("Last, First Middle")
      end

    end

    describe "#initials" do

      it "with given" do
        GIVEN.initials.must_equal("G")
      end

      it "with first" do
        FIRST.initials.must_equal("F")
      end

      it "with middle" do
        MIDDLE.initials.must_equal("M")
      end

      it "with family" do
        FAMILY.initials.must_equal("F")
      end

      it "with last" do
        LAST.initials.must_equal("L")
      end

      it "with given & middle" do
        GIVEN_MIDDLE.initials.must_equal("GM")
      end

      it "with first & middle" do
        FIRST_MIDDLE.initials.must_equal("FM")
      end

      it "with given & family" do
        GIVEN_FAMILY.initials.must_equal("GF")
      end

      it "with first & last" do
        FIRST_LAST.initials.must_equal("FL")
      end

      it "with middle & family" do
        MIDDLE_FAMILY.initials.must_equal("MF")
      end

      it "with middle & last" do
        MIDDLE_LAST.initials.must_equal("ML")
      end

      it "with given & middle & family" do
        GIVEN_MIDDLE_FAMILY.initials.must_equal("GMF")
      end

      it "with first & middle & last" do
        FIRST_MIDDLE_LAST.initials.must_equal("FML")
      end

    end

    describe "#given_name_middle_name" do 

      it "with given" do
        GIVEN.given_name_middle_name.must_equal("Given")
      end

      it "with middle" do
        MIDDLE.given_name_middle_name.must_equal("Middle")
      end

      it "with last" do
        LAST.given_name_middle_name.must_equal("")
      end
      
      it "with given & middle" do
        GIVEN_MIDDLE.given_name_middle_name.must_equal("Given Middle")
      end

      it "with given & family" do
        GIVEN_FAMILY.given_name_middle_name.must_equal("Given")
      end

      it "with middle & family" do
        MIDDLE_FAMILY.given_name_middle_name.must_equal("Middle")
      end

      it "with given & middle & family" do
        GIVEN_MIDDLE_FAMILY.given_name_middle_name.must_equal("Given Middle")
      end

    end

    describe "#first_name_middle_name" do 

      it "with first" do
        FIRST.first_name_middle_name.must_equal("First")
      end

      it "with middle" do
        MIDDLE.first_name_middle_name.must_equal("Middle")
      end

      it "with last" do
        LAST.first_name_middle_name.must_equal("")
      end
      
      it "with first & middle" do
        FIRST_MIDDLE.first_name_middle_name.must_equal("First Middle")
      end

      it "with first & last" do
        FIRST_LAST.first_name_middle_name.must_equal("First")
      end

      it "with middle & last" do
        MIDDLE_LAST.first_name_middle_name.must_equal("Middle")
      end

      it "with first & middle & last" do
        FIRST_MIDDLE_LAST.first_name_middle_name.must_equal("First Middle")
      end

    end

    describe "#given_name_middle_initial" do

      it "with given" do 
        GIVEN.given_name_middle_initial.must_equal("Given")
      end

      it "with middle" do 
        MIDDLE.given_name_middle_initial.must_equal("M")
      end

      it "with family" do
        FAMILY.given_name_middle_initial.must_equal("")
      end

      it "with given & middle" do 
        GIVEN_MIDDLE.given_name_middle_initial.must_equal("Given M")
      end

      it "with given & family" do
        GIVEN_FAMILY.given_name_middle_initial.must_equal("Given")
      end

      it "with middle & family" do
        MIDDLE_FAMILY.given_name_middle_initial.must_equal("M")
      end

      it "with given & middle & family" do 
        GIVEN_MIDDLE_FAMILY.given_name_middle_initial.must_equal("Given M")
      end
      
    end

    describe "#first_name_middle_initial" do

      it "with first" do 
        FIRST.first_name_middle_initial.must_equal("First")
      end

      it "with middle" do 
        MIDDLE.first_name_middle_initial.must_equal("M")
      end

      it "with last" do
        LAST.first_name_middle_initial.must_equal("")
      end

      it "with first & middle" do 
        FIRST_MIDDLE.first_name_middle_initial.must_equal("First M")
      end

      it "with first & last" do
        FIRST_LAST.first_name_middle_initial.must_equal("First")
      end

      it "with middle & last" do
        MIDDLE_LAST.first_name_middle_initial.must_equal("M")
      end

      it "with first & middle & last" do 
        FIRST_MIDDLE_LAST.first_name_middle_initial.must_equal("First M")
      end
      
    end

    describe "#given_name_middle_initial_family_name" do

      it "with given" do
        GIVEN.given_name_middle_initial_family_name.must_equal("Given")
      end

      it "with middle" do
        MIDDLE.given_name_middle_initial_family_name.must_equal("M")
      end

      it "with family" do
        FAMILY.given_name_middle_initial_family_name.must_equal("Family")
      end

      it "with given &_middle" do
        GIVEN_MIDDLE.given_name_middle_initial_family_name.must_equal("Given M")
      end

      it "with given &_family" do
        GIVEN_FAMILY.given_name_middle_initial_family_name.must_equal("Given Family")
      end

      it "with middle &_family" do
        MIDDLE_FAMILY.given_name_middle_initial_family_name.must_equal("M Family")
      end

      it "with given & middle &_family" do
        GIVEN_MIDDLE_FAMILY.given_name_middle_initial_family_name.must_equal("Given M Family")
      end

    end

    describe "#first_name_middle_initial_last_name" do

      it "with first" do
        FIRST.first_name_middle_initial_last_name.must_equal("First")
      end

      it "with middle" do
        MIDDLE.first_name_middle_initial_last_name.must_equal("M")
      end

      it "with last" do
        LAST.first_name_middle_initial_last_name.must_equal("Last")
      end

      it "with first &_middle" do
        FIRST_MIDDLE.first_name_middle_initial_last_name.must_equal("First M")
      end

      it "with first &_last" do
        FIRST_LAST.first_name_middle_initial_last_name.must_equal("First Last")
      end

      it "with middle &_last" do
        MIDDLE_LAST.first_name_middle_initial_last_name.must_equal("M Last")
      end

      it "with first & middle &_last" do
        FIRST_MIDDLE_LAST.first_name_middle_initial_last_name.must_equal("First M Last")
      end

    end

  end

end


class Person

  attr_accessor :given_name
  attr_accessor :first_name
  attr_accessor :middle_name
  attr_accessor :family_name
  attr_accessor :last_name

  include PersonName

  def initialize(opts = {})
    @given_name = opts[:given_name]
    @first_name = opts[:first_name]
    @middle_name = opts[:middle_name]
    @family_name = opts[:family_name]
    @last_name = opts[:last_name]
  end

end
