require 'spec_helper'

describe "canadian pension plan" do
  subject { CalculatorGem::Calculator.new("201101") }

  before(:each) do
    @today = Time.now.utc.to_date
    subject.birthday = Date.new(@today.year - 30, @today.month, @today.day)
    subject.I = 1000
    subject.P = 26
    subject.D = 0
  end

  it "when employee is younger than 18, CPP is 0" do
    subject.birthday = Time.now.utc.to_date
    subject.c.should == 0
  end

  it "when employee is older than 70, CPP is 0" do
    subject.birthday = Date.new(@today.year - 70, @today.month, @today.day)
    subject.c.should == 0
  end

  it "when max CPP contribution reached, C = 0" do
    subject.D = 2217.60
    subject.c.should == 0
  end

  it "C is not negative " do
    subject.P = 1
    subject.I = 3000
    subject.c.should == 0
  end

  it "when I = 4000, P = 12, C = 183.56" do
    subject.P = 12
    subject.I = 4000
    subject.c.should == 183.56
  end

  it "When IE is 100000, D = 0.00, C = 2217.60" do
    subject.I = 100000
    subject.c.should == 2217.60
  end

end

#CPP deduction is rounded to the nearest .01
#When using previous year tax tables, CPP deduction is calculated with previous year percentage and maximum
#When using current year tax tables, CPP deduction is calculated with current year percentage and maximum