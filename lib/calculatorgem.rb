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
                  :birthday,
                  :tt,
                  :QPIP_YTD

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

    def qpip
      return 0 unless province == "QC"
      max = round (@tt.QPIP_MAX - @QPIP_YTD)
      calc = round (@tt.QPIP_RATE * @I)
      qpip = max < calc ? max : calc
      qpip < 0 ? 0 : qpip
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
      ei_calc = @P * ei
      ei_calc = ei_calc < @tt.EI_MAX ? ei_calc : @tt.EI_MAX
      ei_portion = @tt.FIRST_FED_RATE * ei_calc

      round (cpp_portion + ei_portion)
    end

    def k2q
      qc_ei_calc = @P * qc_ei
      qc_ei_calc = qc_ei_calc < @tt.QC_EI_MAX ? qc_ei_calc : @tt.QC_EI_MAX
      qc_ei_portion = @tt.FIRST_FED_RATE * qc_ei_calc

      qpip_calc = @P * qpip
      qpip_calc = qpip_calc < @tt.QPIP_MAX ? qpip_calc : @tt.QPIP_MAX
      qpip_portion = @tt.FIRST_FED_RATE * qpip_calc

      round (cpp_portion + qc_ei_portion + qpip_portion)
    end

#    def k3
#      @K3
#    end

    def k4
      calc = round (@tt.FIRST_FED_RATE * a)
      min = round (@tt.FIRST_FED_RATE * @tt.K4_MIN)
      k4 = min < calc ? min : calc
      k4 < 0 ? 0 : k4
    end

    def t3
      if province == "QC"
        qc_t3 = (r * a) - k - k1 - k2q - @K3 - k4
        return round (qc_t3 < 0 ? 0 : qc_t3)
      end
      t3_calc = (r * a) - k - k1 - k2 - @K3 - k4
      round (t3_calc < 0 ? 0 : t3_calc)
    end

    private
    def round(amt)
      ("%.2f" % amt).to_f
    end

    def age
      now = Time.now.utc.to_date
      now.year - @birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    end

    def cpp_portion
      cpp_calc = @P * c
      cpp_calc = cpp_calc < @tt.CPP_MAX ? cpp_calc : @tt.CPP_MAX
      @tt.FIRST_FED_RATE * cpp_calc
    end

  end

end
