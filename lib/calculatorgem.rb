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
                  :QPIP_YTD,
                  :FED_LAB_TC

    def initialize (tax_table)
      @tt = TaxTableFactory.get_tax_table tax_table
    end

    def ei
      return 0 if quebec?
      max = round (@tt.EI_MAX - @D1)
      calc = round (@tt.EI_RATE * @I)
      ei = max < calc ? max : calc
      ei < 0 ? 0 : ei
    end

    def qc_ei
      return 0 unless quebec?
      max = round (@tt.QC_EI_MAX - @D1)
      calc = round (@tt.QC_EI_RATE * @I)
      qc_ei = max < calc ? max : calc
      qc_ei < 0 ? 0 : qc_ei
    end

    def qpip
      return 0 unless quebec?
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
      min = round (@tt.FIRST_FED_RATE * @tt.K4_MAX)
      k4 = min < calc ? min : calc
      k4 < 0 ? 0 : k4
    end

    def t3
      if quebec?
        qc_t3 = (r * a) - k - k1 - k2q - @K3 - k4
        return round (qc_t3 < 0 ? 0 : qc_t3)
      end
      t3_calc = (r * a) - k - k1 - k2 - @K3 - k4
      round (t3_calc < 0 ? 0 : t3_calc)
    end

    def lcf
      calc = round (@tt.FIRST_FED_RATE * @FED_LAB_TC)
      max = round (@tt.FED_LAB_TC_MAX)
      lcf = max < calc ? max : calc
      lcf < 0 ? 0 : lcf
    end

    def t1
      if quebec?
        qc_calc = t3 - lcf
        qc_calc < 0 ? 0 : qc_calc

        adj = @tt.QC_T1_RATE * t3
        qc_t1 = round (qc_calc - adj)
        return qc_t1 < 0 ? 0 : qc_t1
      end

      if outside_canada?
        os_t1 = round ((t3 + @tt.OS_T1_RATE * t3) - lcf)
        return os_t1 < 0 ? 0 : os_t1
      end

      t1 = round (t3 - lcf)
      t1 < 0 ? 0 : t1
    end

    #TODO no provincial tax included
    def t
      return @L if a < 0
      round ((t1 / @P) +@L)
    end

    def total_deductions
      return round (t + c + qc_ei + @F + @U1 + @F2) if quebec?
      round (t + c + ei + @F + @U1 + @F2)
    end

    def net
      @I - total_deductions
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

    def quebec?
      province == "QC"
    end

    def outside_canada?
      province == "OS"
    end

  end

end
