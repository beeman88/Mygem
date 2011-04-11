module Taxtable

    class TaxTableFactory

      def self.get_tax_table(tax_table)
        return Tbl201101.new if tax_table == "201101"
        return Tbl201007.new if tax_table == "201007"
      end
    end

    class TaxTable

      def method_missing(name)
         eval("#{self.class}::#{name}")
       end

    end

    class Tbl201101 < TaxTable

      NAME = "2011 Jan"

      EI_RATE = 0.0178
      EI_MAX  = 786.76

      QC_EI_RATE = 0.0141
      QC_EI_MAX  = 623.22

      QPIP_RATE = 0.00537
      QPIP_MAX = 343.68

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

    class Tbl201007 < TaxTable

      NAME = "2010 Jul"

      EI_RATE = 0.0178
      EI_MAX  = 786.76

      QC_EI_RATE = 0.0141
      QC_EI_MAX  = 623.22

      QPIP_RATE = 0.00537
      QPIP_MAX = 343.68

      CPP_RATE = 0.0495
      CPP_EXEMPTION = 3500.00
      CPP_MAX = 2217.60

      FED_RATES = [ [40970,  0.15],
                    [81941,  0.22],
                    [127021, 0.26],
                    [nil,    0.29] ]

      FED_K     = [ [40970,     0],
                    [81941,  2908],
                    [127021, 6232],
                    [nil,   10096] ]

      FIRST_FED_RATE = FED_RATES[0][1]

      K4_MIN = 1065

    end

end