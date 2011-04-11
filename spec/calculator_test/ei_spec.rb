require 'spec_helper'

describe "employment insurance" do
  subject { CalculatorGem::Calculator.new("201101") }

  before(:each) do
    subject.I = 1000
    subject.D1 = 0
    subject.QPIP_YTD = 0
    subject.province = "SK"
  end

  context "ei" do
    it "For QC employee EI is 0" do
      subject.province = "QC"
      subject.ei.should == 0
    end

    it "For non QC employee with IE, EI is not 0" do
      subject.ei.should_not == 0
    end

    it "When IE is 1000, D1 = 786.76, EI = 0" do
      subject.D1 = 786.76
      subject.ei.should == 0
    end

    it "When IE is 1000, D1 = 100.00, EI = 17.80" do
      subject.D1 = 100.00
      subject.ei.should == 17.80
    end

    it "When IE is 1000, D1 = 780.00, EI = 6.76" do
      subject.D1 = 780.00
      subject.ei.should == 6.76
    end

    it "When IE is 100000, D1 = 0.00, EI = 786.76" do
      subject.I = 100000
      subject.ei.should == 786.76
    end

  end

  context "qc_ei" do

    before(:each) do
      subject.province = "QC"
    end

    it "For non QC employee QC EI is 0" do
      subject.province = "ON"
      subject.qc_ei.should == 0
    end

    it "For QC employee with IE, QC EI is not 0" do
      subject.qc_ei.should_not == 0
    end

    it "When IE is 1000, D1 = 623.22, EI = 0" do
      subject.D1 = 623.22
      subject.qc_ei.should == 0
    end

    it "When IE is 1000, D1 = 100.00, QC EI = 14.10" do
      subject.D1 = 100.00
      subject.qc_ei.should == 14.10
    end

    it "When IE is 1000, D1 = 610.00, EI = 6.76" do
      subject.D1 = 610.00
      subject.qc_ei.should == 13.22
    end

    it "When IE is 100000, D1 = 0.00, EI = 623.22" do
      subject.I = 100000
      subject.qc_ei.should == 623.22
    end

  end

  context "qpip" do

    before(:each) do
      subject.province = "QC"
    end

    it "For non QC employee QIP" do
      subject.province = "ON"
      subject.qpip.should == 0
    end

    it "For QC employee with IE, QC EI is not 0" do
      subject.qpip.should_not == 0
    end

    it "When IE is 1000, QPIP_YTD = 343.68, QPIP = 0" do
      subject.QPIP_YTD = 623.22
      subject.qpip.should == 0
    end

    it "When IE is 1000, QPIP_YTD = 100.00, QPIP = 5.37" do
      subject.QPIP_YTD = 100.00
      subject.qpip.should == 5.37
    end

    it "When IE is 1000, QPIP_YTD = 340.00, QPIP = 3.68" do
      subject.QPIP_YTD = 340.00
      subject.qpip.should == 3.68
    end

    it "When IE is 100000, QPIP_YTD = 0.00, QPIP = 343.68" do
      subject.I = 100000
      subject.qpip.should == 343.68
    end

  end

end

