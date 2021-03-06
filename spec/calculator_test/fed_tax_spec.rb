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

  context "A - annual taxable income" do
    # when P = 27, I = 1000, F = 250, F2 = 500, U1 = 150, HD = 500, F1 = 300 then A = 1900" do
    it "A = [P * (I - F -F2 -U1)] - HD - F1" do
      subject.P = 27
      subject.F = 250
      subject.F2 = 500
      subject.U1 = 150
      subject.HD = 500
      subject.F1 = 300
      subject.a.should == 1900
    end
  end

  context "R - federal tax rate" do

    it "when 0 < A <= 41,544 then R = .15" do
      subject.stub(:a).and_return(26000)
      subject.r.should == 0.15
    end

    it "when 41,544 < A <= 83,088 then R = .22" do
      subject.stub(:a).and_return(52000)
      subject.r.should == 0.22
    end

    it "when 83,088 < A <= 128,800 then R = .26" do
      subject.stub(:a).and_return(104000)
      subject.r.should == 0.26
    end

    it "when A > 128,800 then R = .29" do
      subject.stub(:a).and_return(130000)
      subject.r.should == 0.29
    end

  end

  context "K - federal constant" do

    it "when 0 < A <= 41,544 then K = 0" do
      subject.stub(:a).and_return(26000)
      subject.k.should == 0
    end

    it "when 41,544 < A <= 83,088 then K = 2,908" do
      subject.stub(:a).and_return(52000)
      subject.k.should == 2908
    end

    it "when 83,088 < A <= 128,800 then K = 6,232" do
      subject.stub(:a).and_return(104000)
      subject.k.should == 6232
    end

    it "when A > 128,800 then K = 10.096" do
      subject.stub(:a).and_return(130000)
      subject.k.should == 10096
    end

  end

  context "K1 - federal non refundable personal tax credit" do

    it "K1 = .15 * TC (default TC = 10,527 then K1 = 1,579.05)" do
      subject.TC = 10527
      subject.k1.should == 1579.05
    end

    it "K1 = .15 * TC (when TC = 27,447 then K1 = 4,117.05)" do
      subject.TC = 27447
      subject.k1.should == 4117.05
    end

  end

  context "K2 - federal cpp contributions and EI premium tax credits for the year" do
    # when P = 26, C = 42.84, EI = 17.80, then K2 = 236.50 (IE = 1000)
    it "multiply the CPP and EI portions by 0.1500" do
      subject.stub(:c).and_return(42.84)
      subject.stub(:ei).and_return(17.80)
      subject.k2.should == 236.50
    end

    # when P = 26,  C = 92.34, EI = 35.60, then K2 =  450.65 (IE = 2000)
    it "when the CPP portion reaches the maximum use 2,217.60" do
      subject.stub(:c).and_return(92.34)
      subject.stub(:ei).and_return(25.60)
      subject.I = 2000
      subject.k2.should == 432.48
    end

    # when P = 26,  C = 77.49, EI = 35.60, then K2 =  420.22 (IE = 1700)
    it "when the EI portion reaches the maximum use 786.76" do
      subject.stub(:c).and_return(77.49)
      subject.stub(:ei).and_return(30.26)
      subject.I = 1700
      subject.k2.should == 420.22
    end

  end

  context "K4 - canada employment credit" do

    it "when .15 * A >= 159.75 then K4 = 159.75" do
      subject.stub(:a).and_return(2000)
      subject.k4.should == 159.75
    end

    it "when .15 * A < 159.75 then K4 = .15 * A" do
      subject.stub(:a).and_return(1000)
      subject.k4.should == 150.00
    end
  end

  context "T3 - annual basic federal tax" do

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

    it "T3 can never be negative" do
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

    it "T3 is rate * income minus K values" do
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

  context "LCF - federal labour-sponsored tax credit" do
    # when approved shared purchase = 2000 then LCF = 300
    it "when approved shared purchase * .15 < 750 then LCF = .15 * approved share purchase" do
      subject.FED_LAB_TC = 2000
      subject.lcf.should == 300
    end

    # when approved shared purchase =  6000 then LCF = 750
    it "when approved shared purchase * .15 >= 750 then LCF = 750" do
      subject.FED_LAB_TC = 6000
      subject.lcf.should == 750
    end

    it "When approved shared purchase = 0 then LCF = 0" do
      subject.FED_LAB_TC = 0
      subject.lcf.should == 0
    end

  end

  context "T1 - annual federal tax deduction" do
    # when employees province is not QC, T3 = 700, LCF = 750 then T1 = 0
    it "when employees province is not QC T1 can never be negative" do
      subject.province = "BC"
      subject.stub(:t3).and_return(700)
      subject.stub(:lcf).and_return(750)
      subject.t1.should == 0
    end

    # When employees province is not QC, T3 = 6000, LCF = 0 then T1 = 6000
    it "When employees province is not QC, then T1 = T3 - LCF" do
      subject.province = "BC"
      subject.stub(:t3).and_return(6000)
      subject.stub(:lcf).and_return(0)
      subject.t1.should == 6000
    end

    # when employees province is QC, T3 = 700, LCF = 750 then T1 = 0
    it "when employees province is QC, T1 can never be negative" do
      subject.province = "QC"
      subject.stub(:t3).and_return(700)
      subject.stub(:lcf).and_return(750)
      subject.t1.should == 0
    end

    # When employees province is QC, T3 = 865, LCF = 750 then T1 = 0
    it "when employees province is QC and (T3 - LCF) - (.165 * T3) < 0 then T1 = 0" do
      subject.province = "QC"
      subject.stub(:t3).and_return(865)
      subject.stub(:lcf).and_return(750)
      subject.t1.should == 0
    end

    # when employees province is QC, T3 = 6000, LCF = 0 then T1 = 5010
    it "when employees province is QC then T1 = (T3 - LCF) - (.165 * T3)" do
      subject.province = "QC"
      subject.stub(:t3).and_return(6000)
      subject.stub(:lcf).and_return(0)
      subject.t1.should == 5010
    end

    # When employee is from outside Canada, T3 = 500, LCF = 750 then T1 = 0
    it "When employee is from outside Canada, T1 can never be negative" do
      subject.province = "OS"
      subject.stub(:t3).and_return(500)
      subject.stub(:lcf).and_return(750)
      subject.t1.should == 0
    end

    # when employee is from outside Canada, T3 = 700, LCF = 750 then T1 = 286
    it "when employee is from outside Canada, T1 = (T3 + (.48 * T3) - LCF)" do
      subject.province = "OS"
      subject.stub(:t3).and_return(700)
      subject.stub(:lcf).and_return(750)
      subject.t1.should == 286
    end

    # when employee is from outside Canada, T3 = 6000, LCF = 0 then T1 = 8880
    it "when employee is from outside Canada and LCF = 0, T1 = (T3 + (.48 * T3) - LCF)" do
      subject.province = "OS"
      subject.stub(:t3).and_return(6000)
      subject.stub(:lcf).and_return(0)
      subject.t1.should == 8880
    end

  end

  #TODO add provincial tax
  context "T - Tax Deduction Per Pay Period" do

    it "when annual income is negative, T = L" do
      subject.stub(:a).and_return(-100)
      subject.L = 100
      subject.t.should == 100
    end

    it "when T1 = 1500.00, P = 26, then Fed Tax Per Period = 57.99" do
      subject.province = "BC"
      subject.stub(:t1).and_return(1500.00)
      subject.P = 26
      subject.t.should == 57.69
    end

    it "when T1 = 1500.00, P = 26, L = 100.00 then Fed Tax Per Period = 157.69" do
      subject.province = "BC"
      subject.stub(:t1).and_return(1500.00)
      subject.P = 26
      subject.L = 100.00
      subject.t.should == 157.69
    end

  end

  context "helper methods" do

    it "total deductions" do
      subject.stub(:t).and_return(1000.00)
      subject.stub(:c).and_return(200.00)
      subject.stub(:ei).and_return(30.00)
      subject.F = 4.00
      subject.U1 = 0.50
      subject.F2 = 0.06
      subject.total_deductions.should == 1234.56
    end

    it "net" do
      subject.stub(:total_deductions).and_return(456.78)
      subject.I = 1000.00
      subject.net.should == 543.22
    end
  end

end

