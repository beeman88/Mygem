require 'spec_helper'

describe "tax tables" do

  context "2011 Jan tax tables" do
    subject { CalculatorGem::Calculator.new("201101") }

    it "when using 2011 tax tables then use 2011 tax class" do
       subject.tt.class.should == Taxtable::Tbl201101
    end

    it "when using 2011 tax tables then use 2011 tax constants" do
       subject.tt.NAME == "2011 Jan"
    end

  end

  context "2010 Jul tax tables" do
    subject { CalculatorGem::Calculator.new("201007") }

    it "when using 2010 tax tables then use 2010 tax class" do
       subject.tt.class.should == Taxtable::Tbl201007
    end

    it "when using 2010 tax tables then use 2010 tax constants" do
       subject.tt.NAME == "2010 Jul"
    end

  end

end