require 'spec_helper'

describe "provincial tax" do
  subject { CalculatorGem::Calculator.new("201101") }

  context "British Columbia" do

    context "V - Provincial tax rate" do
      it "when A = 36,146 tax rate V = 0.0506" do
      end

      it "when A = 72,293 tax rate V = 0.0770" do
      end

      it "when A = 83,001 tax rate V = 0.1050" do
      end

      it "when A = 100,787 tax rate V = 0.1229" do
      end

      it "when A > 100,787 tax rate V = 0.1470" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 36,146 provincial constant KP = 0" do
      end

      it "when A = 72,293 provincial constant KP = 954" do
      end

      it "when A = 83,001 provincial constant KP = 2,978" do
      end

      it "when A = 100,787 provincial constant KP = 4,464" do
      end

      it "when A > 100,787 provincial constant KP = 6,893" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0506 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0506" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "A1 - Annual net income to calculate S" do
      it "A1 only applies to BC" do
      end

      it "A1 = A+ HD" do
      end
    end

    context "S - Provincial tax reduction" do
      it "when A1 <= 17,493, S is lessor of T4 or 394" do
      end

      it "when 17,493 < A1 <= 29,805.50, S is lessor of T4 or 394 - [(A1 - 17,493) * .032]" do
      end

      it "when A1 > 29,805.50, S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase * .15 >= 2000 then LCP = 2000" do
      end

      it "when approved shared purchase * .15 <= 2000 then LCP = .15 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end

  end

  context "Alberta" do

    context "V - Provincial tax rate" do
      it "tax rate V = 0.10" do
      end
    end

    context "KP - Provincial constant" do
      it "Provincial constant KP = 0" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .10 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "when P = 26, C = 42.84, EI = 17.80, then K2P = 157.66 (IE = 1000)" do
      end
    end


    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do
      it "LCP = 0" do
      end
    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 can never be negative" do
      end

      it "T2 = t4" do
      end
    end

  end

  context "Saskatchewan" do
  end

  context "Manitoba" do
    context "V - Provincial tax rate" do
      it "when A = 31,000 tax rate V = 0.1080" do
      end

      it "when A = 67,000 tax rate V = 0.1275" do
      end

      it "when A > 67,000 tax rate V = 0.1740" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 31,000 provincial constant KP = 0" do
      end

      it "when A = 67,000 provincial constant KP = 605" do
      end

      it "when A > 67,000 provincial constant KP = 3,720" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .1080 * TCP (default TCP is 8,134)" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.1080" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase * .15 >= 1800 then LCP = 1800" do
      end

      it "when approved shared purchase * .15 <= 1800 then LCP = .15 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end

  end

  context "Ontario" do
  end

  context "Quebec" do
  end

  context "Nova Scotia" do
    context "V - Provincial tax rate" do
      it "when A = 29,590 tax rate V = 0.0879" do
      end

      it "when A = 59,180 tax rate V = 0.1495" do
      end

      it "when A = 93,000 tax rate V = 0.1667" do
      end

      it "when A = 150,000 tax rate V = 0.1750" do
      end

      it "when A > 150,000 tax rate V = 0.2100" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 29,590 provincial constant KP = 0" do
      end

      it "when A = 59,180 provincial constant KP = 1,823" do
      end

      it "when A = 93,000 provincial constant KP = 2,841" do
      end

      it "when A = 150,000 provincial constant KP = 3,613" do
      end

      it "when A > 150,000 provincial constant KP= 8,863" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0879 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0879" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase * .20 >= 2000 then LCP = 2000" do
      end

      it "when approved shared purchase * .20 <= 2000 then LCP = .15 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end
    
  end

  context "New Brunswick" do
    context "V - Provincial tax rate" do
      it "when A = 37,150 tax rate V = 0.0910" do
      end

      it "when A = 74,300 tax rate V = 0.1210" do
      end

      it "when A = 120,796 tax rate V = 0.1240" do
      end

      it "when A > 120,796 tax rate V = 0.1270" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 37,150 provincial constant KP = 0" do
      end

      it "when A = 74,300 provincial constant KP = 1,115" do
      end

      it "when A = 120,796 provincial constant KP = 1,337" do
      end

      it "when A > 120,796 provincial constant KP = 1,700" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0910 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0910" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase * .20 >= 2000 then LCP = 2000" do
      end

      it "when approved shared purchase * .20 <= 2000 then LCP = .20 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end

  end

  context "Prince Edward Island" do
  end

  context "Newfoundland and Labrador" do
    context "V - Provincial tax rate" do
      it "when A = 31,904 tax rate V = 0.0770" do
      end

      it "when A = 63,807 tax rate V = 0.1250" do
      end

      it "when A > 63,807 tax rate V = 0.1330" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 31,904 provincial constant KP = 0" do
      end

      it "when A = 63,807 provincial constant KP = 1,531" do
      end

      it "when A > 63,807 provincial constant KP = 2,042" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0770 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0770" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase * .20 >= 2000 then LCP = 2000" do
      end

      it "when approved shared purchase * .20 <= 2000 then LCP = .20 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end

  end

  context "Yukon" do
  end

  context "Northwest Territories" do
    context "V - Provincial tax rate" do
      it "when A = 37,626 tax rate V = 0.0590" do
      end

      it "when A = 75,253 tax rate V = 0.0860" do
      end

      it "when A = 122,345 tax rate V = 0.1220" do
      end

      it "when A > 122,345 tax rate V = 0.1405" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 37,626 provincial constant KP = 0" do
      end

      it "when A = 75,253 provincial constant KP = 1,016" do
      end

      it "when A = 122,345 provincial constant KP = 3,725" do
      end

      it "when A > 122,345 provincial constant KP = 5,988" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0590 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0506" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase > 100,000 then LCP = 29,250" do
      end

      it "when approved shared purchase <= 5,000 then LCP = .15 * approved share purchase" do
      end

      it "when 5,000 < approved shared purchase > 100,000 then LCP = .15 * 5,000 + .30 * (approved share purchase - 5,000)" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end

  end

  context "Nunavut" do
    context "V - Provincial tax rate" do
      it "when A = 36,146 tax rate V = 0.0506" do
      end

      it "when A = 72,293 tax rate V = 0.0770" do
      end

      it "when A = 83,001 tax rate V = 0.1050" do
      end

      it "when A = 100,787 tax rate V = 0.1229" do
      end

      it "when A > 100,787 tax rate V = 0.1470" do
      end
    end

    context "KP - Provincial constant" do
      it "when A = 36,146 provincial constant KP = 0" do
      end

      it "when A = 72,293 provincial constant KP = 954" do
      end

      it "when A = 83,001 provincial constant KP = 2,978" do
      end

      it "when A = 100,787 provincial constant KP = 4,464" do
      end

      it "when A > 100,787 provincial constant KP = 6,893" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0506 * TCP" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0506" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "V1 = 0" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do
      it "LCP = 0" do
      end
    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + v1 - S - LCP" do
      end
    end

  end

end