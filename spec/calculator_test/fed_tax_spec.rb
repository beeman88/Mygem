require 'spec_helper'

describe "federal tax" do
  subject { CalculatorGem::Calculator.new("201101") }

  before(:each) do
    subject.I = 1000
    subject.P = 26
    subject.F = 0
    subject.F1 = 0
    subject.F2 = 0
    subject.U1 = 0
    subject.HD = 0
    subject.L = 0
  end

  context "A - annual income" do

    it "when P = 27, I = 1000, F = 250, F2 = 500, U1 = 150, HD = 500, F1 = 300 then A = 1900" do
      subject.P = 27
      subject.F = 250
      subject.F2 = 500
      subject.U1 = 150
      subject.HD = 500
      subject.F1 = 300
      subject.a.should == 1900
    end
  end

  context "t1" do

    it "when annual income is negative, T = L" do
      subject.stub(:a).and_return(-100)
      subject.L = 100
      subject.t.should == 100
    end
  end

  context "R - Federal Rate" do

    it "when A = 26,000 then R = .15" do
      subject.stub(:a).and_return(26000)
      subject.r.should == 0.15
    end

    it "when A = 52,000 then R = .22" do
      subject.stub(:a).and_return(52000)
      subject.r.should == 0.22
    end


    it "when A = 104,000 then R = .26" do
      subject.stub(:a).and_return(104000)
      subject.r.should == 0.26
    end

    it "when A = 130,000 then R = .29" do
      subject.stub(:a).and_return(130000)
      subject.r.should == 0.29
    end

  end

  context "k" do

    it "when A = 26,000 then K = 0" do
      subject.stub(:a).and_return(26000)
      subject.k.should == 0
    end

    it "when A = 52,000 then K = 2,908" do
      subject.stub(:a).and_return(52000)
      subject.k.should == 2908
    end

    it "when A = 104,000 then K = 6,232" do
      subject.stub(:a).and_return(104000)
      subject.k.should == 6232
    end

    it "when A = 130,000 then K = 10.096" do
      subject.stub(:a).and_return(130000)
      subject.k.should == 10096
    end

  end

  context "k1" do

    it "when TC = 10,527 then K1 = 1,579.05" do
      subject.TC = 10527
      subject.k1.should == 1579.05
    end

    it "when TC = 27,447 then K1 = 4,117.05" do
      subject.TC = 27447
      subject.k1.should == 4117.05
    end

  end

  context "k2" do

    it "when P = 26, C = 42.84, EI = 17.80, then K2 = 236.50 (IE = 1000)" do
      subject.stub(:c).and_return(42.84)
      subject.stub(:ei).and_return(17.80)
      subject.k2.should == 236.50
    end

    it "When P = 26,  C = 77.49, EI = 30.26, then K2 =  420.22 (IE = 1700)" do
      subject.stub(:c).and_return(77.49)
      subject.stub(:ei).and_return(30.26)
      subject.I = 1700
      subject.k2.should == 420.22
    end

    it "when P = 26,  C = 92.34, EI = 35.60, then K2 =  450.65 (IE = 2000)" do
      subject.stub(:c).and_return(92.34)
      subject.stub(:ei).and_return(35.60)
      subject.I = 2000
      subject.k2.should == 450.65
    end

  end

  context "k4" do

    it "when A = 2000 then K4 = 159.75" do
      subject.stub(:a).and_return(2000)
      subject.k4.should == 159.75
    end

    it "when A = 1000 then K4 = 150.00" do
      subject.stub(:a).and_return(1000)
      subject.k4.should == 150.00
    end
  end

  context "t3" do

    it "QC employee uses K2Q for T3" do
      subject.stub(:r).and_return(0.15)
      subject.stub(:a).and_return(2000)
      subject.stub(:k).and_return(0)
      subject.stub(:k1).and_return(0)
      subject.stub(:k2q).and_return(100)
      subject.K3 = 0
      subject.province = "QC"
      subject.stub(:k4).and_return(0)
      subject.t3.should == 200
    end

    it "non QC employee uses K2 for T3" do
      subject.stub(:r).and_return(0.15)
      subject.stub(:a).and_return(2000)
      subject.stub(:k).and_return(0)
      subject.stub(:k1).and_return(0)
      subject.stub(:k2).and_return(222)
      subject.K3 = 0
      subject.province = "SK"
      subject.stub(:k4).and_return(0)
      subject.t3.should == 78
    end

    it "t3 can never be negative" do
      subject.stub(:r).and_return(0.15)
      subject.stub(:a).and_return(2000)
      subject.stub(:k).and_return(2000)
      subject.stub(:k1).and_return(0)
      subject.stub(:k2).and_return(0)
      subject.K3 = 0
      subject.province = "SK"
      subject.stub(:k4).and_return(0)
      subject.t3.should == 0
    end

    it "t3 is rate * income minus k values" do
      subject.stub(:r).and_return(0.15)
      subject.stub(:a).and_return(2000)
      subject.stub(:k).and_return(11.11)
      subject.stub(:k1).and_return(22.22)
      subject.stub(:k2).and_return(33.33)
      subject.K3 = 44.44
      subject.province = "SK"
      subject.stub(:k4).and_return(55.55)
      subject.t3.should == 133.35
    end

  end

end

