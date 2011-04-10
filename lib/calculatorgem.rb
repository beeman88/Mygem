require 'date'
require 'Taxtable'

module CalculatorGem

  class Calculator

    include Taxtable

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
      @tt = TaxTableFactory.get_tax_table tax_table
    end

    def ei
      return 0 if province == "QC"
      max = round (@tt.EI_MAX - @D1)
      calc = round (@tt.EI_RATE * @I)
      ei = max < calc ? max : calc
      ei < 0 ? 0 : ei
    end

    def qc_ei
      return 0 unless province == "QC"
      max = round (@tt.QC_EI_MAX - @D1)
      calc = round (@tt.QC_EI_RATE * @I)
      qc_ei = max < calc ? max : calc
      qc_ei < 0 ? 0 : qc_ei
    end

    def c
      return 0 if age < 18 || age > 69
      max = round (@tt.CPP_MAX - @D)
      calc = round (@tt.CPP_RATE * (@I - (@tt.CPP_EXEMPTION / @P)))
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
      @tt.FED_RATES.each do |threshold, rate|
        return rate if threshold.nil?
        return rate if a < threshold
      end
    end

    def k
      @tt.FED_K.each do |threshold, k|
        return k if threshold.nil?
        return k if a < threshold
      end
    end

    def k1
      @tt.FIRST_FED_RATE * @TC
    end

    def k2
      cpp_calc = @P * c
      cpp_calc = cpp_calc < @tt.CPP_MAX ? cpp_calc : @tt.CPP_MAX
      k2_cpp = @tt.FIRST_FED_RATE * cpp_calc

      ei_calc = @P * ei
      ei_calc = ei_calc < @tt.EI_MAX ? ei_calc : @tt.EI_MAX
      k2_ei = @tt.FIRST_FED_RATE * ei_calc

      round (k2_cpp + k2_ei)
    end

    def k4
      calc = round (@tt.FIRST_FED_RATE * a)
      min = round (@tt.FIRST_FED_RATE * @tt.K4_MIN)
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

end
