require 'spec_helper'

describe "provincial tax" do
  subject { CalculatorGem::Calculator.new("201101") }

  context "British Columbia" do

    context "V - Provincial tax rate" do
      it "when 0 < A <= 36,146 tax rate V = 0.0506" do
      end

      it "when 36,146 < A <= 72,293 tax rate V = 0.0770" do
      end

      it "when 72,293 < A <= 83,001 tax rate V = 0.1050" do
      end

      it "when 83,001 < A <= 100,787 tax rate V = 0.1229" do
      end

      it "when A > 100,787 tax rate V = 0.1470" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 36,146 provincial constant KP = 0" do
      end

      it "when 36,146 < A <= 72,293 provincial constant KP = 954" do
      end

      it "when 72,293 < A <= 83,001 provincial constant KP = 2,978" do
      end

      it "when 83,001 < A <= 100,787 provincial constant KP = 4,464" do
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

      it "A1 = A + HD" do
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

      it "T2 = T4 + V1 - S - LCP" do
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
    context "V - Provincial tax rate" do
      it "when 0 < A <= 40,919 tax rate V = 0.1100" do
      end

      it "when 40,919 < A <= 116,911 tax rate V = 0.1300" do
      end

      it "when A > 116,911 tax rate V = 0.1500" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 40,919 provincial constant KP = 0" do
      end

      it "when 40,919 < A <= 116,911 provincial constant KP = 818" do
      end

      it "when A > 116,911 provincial constant KP = 3,157" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .1100 * TCP (default TCP is 13,535)" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.1100" do
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

      it "when approved shared purchase * .20 >= 1000 then LCP = 1000" do
      end

      it "when approved shared purchase * .20 <= 1000 then LCP = .20 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + V1 - S - LCP" do
      end
    end

  end

  context "Manitoba" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 31,000 tax rate V = 0.1080" do
      end

      it "when 31,00 < A <= 67,000 tax rate V = 0.1275" do
      end

      it "when A > 67,000 tax rate V = 0.1740" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A = 31,000 provincial constant KP = 0" do
      end

      it "when 31,000 < A <= 67,000 provincial constant KP = 605" do
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

      it "T2 = T4 + V1 - S - LCP" do
      end
    end

  end

  context "Ontario" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 37,774 tax rate V = 0.0505" do
      end

      it "when 37,774 < A <= 75,550 tax rate V = 0.0915" do
      end

      it "when A > 75,550 tax rate V = 0.1116" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 37,774 provincial constant KP = 0" do
      end

      it "when 37,774 < A <= 75,550 provincial constant KP = 1,549" do
      end

      it "when A > 75,550 provincial constant KP = 3,067" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0505 * TCP (default TCP us 9,104" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0505" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "T4 <= 4,078 then V1 = 0" do
      end

      it "4,078 < T4 <= 5,219 then V1 = .20 * (T4 - 4,078)" do
      end

      it "5,219 < T4 then V1 = .20 * (T4 - 4,078) + .36 * (T4 - 5,219)" do
      end
    end

    context "V2 - Additional tax calculated on taxable income (applies to Ontario Health Premium only)" do
      it "A <= 20,000 then V2 = 0" do
      end

      it "20,000 < A <= 36,000 and .06 * (A - 20,000) >= 300 then V2 = 300" do
      end

      it "20,000 < A <= 36,000 and .06 * (A - 20,000) < 300 then V2 = .06 * (A - 20,000)" do
      end

      it "36,000 < A <= 48,000 and 300 + .06 * (A - 36,000) >= 450 then V2 = 450" do
      end

      it "36,000 < A <= 48,000 and 300 + .06 * (A - 36,000) < 450 then V2 = 300 + .06 * (A - 36,000)" do
      end

      it "48,000 < A <= 72,000 and 450 + .25 * (A - 48,000) >= 600 then V2 = 600" do
      end

      it "48,000 < A <= 72,000 and 450 + .25 * (A - 48,000) < 600 then V2 = 450 + .25 * (A - 48,000)" do
      end

      it "72,000 < A <= 200,000 and 600 + .25 * (A - 72,000) >= 750 then V2 = 750" do
      end

      it "72,000 < A <= 200,000 and 600 + .25 * (A - 72,000) < 750 then V2 = 600 + .25 * (A - 72,000)" do
      end

      it "200,000 < A and 750 + .25 * (A - 200,000) >= 900 then V2 = 900" do
      end

      it "200,000 < A and 750 + .25 * (A - 200,000) < 900 then V2 = 750 + .25 * (A - 200,000)" do
      end

    end

    context "Y - Additional prov tax reduction based on applicable amounts reported on the provincial
Form TD1" do
      it "when number of disabled dependents is n then Y = n * 389" do
      end

      it "when number of dependents under 19 is n then Y = n * 389" do
      end

      it "when number of disabled dependents is n and dependents under 19 is p then Y = (n + p) * 389" do
      end


    end

    context "S - Provincial tax reduction" do
      it "S can never be negative" do
      end

      it "when [2 * (210 + Y)] - [T4 + V1] <= T4 + V1 then S = [2 * (210 + Y)] - [T4 + V1]" do
      end

      it "when [2 * (210 + Y)] - [T4 + V1] > T4 + V1 then S = T4 + V1" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do

      it "when approved shared purchase * .05 >= 375 then LCP = 375" do
      end

      it "when approved shared purchase * .05 <= 375 then LCP = .05 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + V1 + V2 - S - LCP" do
      end
    end

  end

  context "Quebec" do
  end

  context "Nova Scotia" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 29,590 tax rate V = 0.0879" do
      end

      it "when 29,590 < A <= 59,180 tax rate V = 0.1495" do
      end

      it "when 59,180 < A <= 93,000 tax rate V = 0.1667" do
      end

      it "when 93,000 < A <= 150,000 tax rate V = 0.1750" do
      end

      it "when A > 150,000 tax rate V = 0.2100" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A = 29,590 provincial constant KP = 0" do
      end

      it "when 29,250 < A <= 59,180 provincial constant KP = 1,823" do
      end

      it "when 59,180 < A <= 93,000 provincial constant KP = 2,841" do
      end

      it "when 93,000 < A <= 150,000 provincial constant KP = 3,613" do
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
    context "V - Provincial tax rate" do
      it "when 0 < A <= 31,984 tax rate V = 0.0980" do
      end

      it "when 31,984 < A <= 63,969 tax rate V = 0.1380" do
      end

      it "when 63,969 < A tax rate V = 0.1670" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 31,984 provincial constant KP = 0" do
      end

      it "when 31,984 < A <= 63,969 provincial constant KP = 1,279" do
      end

      it "when 63,969 < A provincial constant KP = 3,134" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0980 * TCP (default TCP = 7,708)" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0980" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "T4 <= 12,500 then V1 = 0" do
      end

      it "T4 > 12,500 then V1 = 0.10 * (T4 - 12,500)" do
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

      it "T2 = T4 + V1 - S - LCP" do
      end
    end

  end

  context "Newfoundland and Labrador" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 31,904 tax rate V = 0.0770" do
      end

      it "when 31,904 < A <= 63,807 tax rate V = 0.1250" do
      end

      it "when A > 63,807 tax rate V = 0.1330" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 31,904 provincial constant KP = 0" do
      end

      it "when 31,904 < A <= 63,807 provincial constant KP = 1,531" do
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

      it "T2 = T4 + V1 - S - LCP" do
      end
    end

  end

  context "Yukon" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 41,544 tax rate V = 0.0704" do
      end

      it "when 41,544 < A <= 83,088 tax rate V = 0.0968" do
      end

      it "when 83,088 < A <= 128,800 tax rate V = 0.1144" do
      end

      it "when A > 128,800 tax rate V = 0.1276" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 41,544 provincial constant KP = 0" do
      end

      it "when 41,544 < A <= 83,088 provincial constant KP = 1,097" do
      end

      it "when 83,088 < A <= 128,800 provincial constant KP = 2,559" do
      end

      it "when A > 128,800 provincial constant KP = 4,259" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0704 * TCP (default tCP is 10,527)" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0704" do
      end

      it "when the CPP portion reaches the maximum use 2,217.60" do
      end

      it "when the EI portion reaches the maximum use 786.76" do
      end
    end

    context "KP4 - Territorial Canada Employment Credit" do
      it "when .0704 * A <= .0704 * 1065 then KP4 = .0704 * A" do
      end

      it "when .0704 * A > .0704 * 1065 then KP4 = .0704 * 1065" do
      end
    end

    context "V1 - Provincial surtax calculated on basic provincial tax" do
      it "when T4 <= 6,000 then V1 = 0" do
      end

      it "when T4 > 6,000 then V1 = .05 * (T4 - 6,000)" do
      end
    end

    context "S - Provincial tax reduction" do
      it "S = 0" do
      end
    end

    context "LCP - provincial labour-sponsored tax credit" do
      it "when approved shared purchase * .25 >= 1250 then LCP = 1250" do
      end

      it "when approved shared purchase * .25 <= 1250 then LCP = .25 * approved share purchase" do
      end

    end

    context "T4 - Annual basic provincial or territorial tax" do
      it "T4 is rate * income minus K values" do
      end
    end

    context "T2 - Annual provincial or territorial tax deduction" do
      it "T2 should never be negative" do
      end

      it "T2 = T4 + V1 - S - LCP" do
      end
    end
  end

  context "Northwest Territories" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 37,626 tax rate V = 0.0590" do
      end

      it "when 37,626 < A <= 75,253 tax rate V = 0.0860" do
      end

      it "when 75,253 < A <= 122,345 tax rate V = 0.1220" do
      end

      it "when A > 122,345 tax rate V = 0.1405" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 37,626 provincial constant KP = 0" do
      end

      it "when 37,626 < A <= 75,253 provincial constant KP = 1,016" do
      end

      it "when 75,253 < A <= 122,345 provincial constant KP = 3,725" do
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

      it "T2 = T4 + V1 - S - LCP" do
      end
    end

  end

  context "Nunavut" do
    context "V - Provincial tax rate" do
      it "when 0 < A <= 39,612 tax rate V = 0.0400" do
      end

      it "when 39,612 < A <= 79,224 tax rate V = 0.0700" do
      end

      it "when 79,224 < A <= 128,800 tax rate V = 0.0900" do
      end

      it "when A > 128,800 tax rate V = 0.1150" do
      end
    end

    context "KP - Provincial constant" do
      it "when 0 < A <= 39,612 provincial constant KP = 0" do
      end

      it "when 39,612 < A <= 79,224 provincial constant KP = 1,188" do
      end

      it "when 79,224 < A <= 128,800 provincial constant KP = 2,773" do
      end

      it "when A > 128,800 provincial constant KP = 5,993" do
      end
    end

    context "KP1 - Provincial non refundable tax credit" do
      it "KP1 = .0400 * TCP (default TCP 11,878)" do
      end
    end

    context "KP2 - CPP and EI provincial credits" do
      it "multiply the CPP and EI portions by 0.0400" do
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

      it "T2 = T4 + V1 - S - LCP" do
      end
    end

  end

end