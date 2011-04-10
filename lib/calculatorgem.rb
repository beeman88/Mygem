require 'date'

module CalculatorGem

  class Calculator

    attr_accessor :EI,
                  :C,
                  :P,
                  :D,
                  :D1,
                  :I,
                  :F,
                  :F1,
                  :F2,
                  :U1,
                  :HD,
                  :L,
                  :TC,
                  :K3,
                  :province,
                  :birthday

    def initialize (tax_table)
      @tax_table = "TBL_" + tax_table
      if tax_table = "201101"
        (class <<self; include TBL_201101; end)
      else
        (class <<self; include TBL_201007; end)
      end
    end

    def ei
      return 0 if province == "QC"
      puts "EI_MAX #{eval(@tax_table + '::EI_MAX')}"
      max = round (EI_MAX - @D1)
      puts "max: #{max}"
      puts "EI_RATE #{EI_RATE}"
      calc = round (EI_RATE * @I)
      puts "calc: #{calc}"
      ei = max < calc ? max : calc
      puts "ei: #{ei}"
      ei < 0 ? 0 : ei
    end

    def qc_ei
      return 0 unless province == "QC"
      max = round (QC_EI_MAX - @D1)
      calc = round (QC_EI_RATE * @I)
      qc_ei = max < calc ? max : calc
      qc_ei < 0 ? 0 : qc_ei
    end

    def c
      return 0 if age < 18 || age > 69
      max = round (CPP_MAX - @D)
      calc = round (CPP_RATE * (@I - (CPP_EXEMPTION / @P)))
      c = max < calc ? max : calc
      c < 0 ? 0 : c
    end

    def a
      round ((@P * (@I - @F - @F2 - @U1)) - @HD - @F1)
    end

    def t
      return @L if a < 0
    end

    def r
      FED_RATES.each do |threshold, rate|
        return rate if threshold.nil?
        return rate if a < threshold
      end
    end

    def k
      FED_K.each do |threshold, k|
        return k if threshold.nil?
        return k if a < threshold
      end
    end

    def k1
      FIRST_FED_RATE * @TC
    end

    def k2
      cpp_calc = @P * c
      cpp_calc = cpp_calc < CPP_MAX ? cpp_calc : CPP_MAX
      k2_cpp = FIRST_FED_RATE * cpp_calc

      ei_calc = @P * ei
      ei_calc = ei_calc < EI_MAX ? ei_calc : EI_MAX
      k2_ei = FIRST_FED_RATE * ei_calc

      round (k2_cpp + k2_ei)
    end

    def k4
      calc = round (FIRST_FED_RATE * a)
      min = round (FIRST_FED_RATE * K4_MIN)
      k4 = min < calc ? min : calc
      k4 < 0 ? 0 : k4
    end

    private
    def round(amt)
      ("%.2f" % amt).to_f
    end

  def age
    now = Time.now.utc.to_date
    now.year - @birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  end

  module TBL_201101

    EI_RATE = 0.0178
    EI_MAX  = 786.76

    QC_EI_RATE = 0.0141
    QC_EI_MAX  = 623.22

    CPP_RATE = 0.0495
    CPP_EXEMPTION = 3500.00
    CPP_MAX = 2217.60

    FED_RATES = [ [41544,  0.15],
                  [83088,  0.22],
                  [128800, 0.26],
                  [nil,    0.29] ]

    FED_K     = [ [41544,     0],
                  [83088,  2908],
                  [128800, 6232],
                  [nil,   10096] ]

    FIRST_FED_RATE = FED_RATES[0][1]

    K4_MIN = 1065

  end

  module TBL_201007

    EI_RATE = 0.0178
    EI_MAX  = 786.76

    QC_EI_RATE = 0.0141
    QC_EI_MAX  = 623.22

    CPP_RATE = 0.0495
    CPP_EXEMPTION = 3500.00
    CPP_MAX = 2217.60

    FED_RATES = [ [41544,  0.15],
                  [83088,  0.22],
                  [128800, 0.26],
                  [nil,    0.29] ]

    FED_K     = [ [41544,     0],
                  [83088,  2908],
                  [128800, 6232],
                  [nil,   10096] ]

    FIRST_FED_RATE = FED_RATES[0][1]

    K4_MIN = 1065

  end


end
