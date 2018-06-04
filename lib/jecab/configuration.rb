# encoding: UTF-8

# Configuration object, singleton, class variable

module Jecab
  class Configuration
    attr_accessor :formatting
    attr_accessor :jmdict_txt
    
    def initialize
      @formatting = {
        dot_separator: false,
        capitalize_claims: false,
        harvard_comma: true
      }
    end

    def formatting=(new_hash)
      @formatting = @formatting.merge(new_hash)
    end

    def jmdict_txt=(txt)
      #convert the txt unless it's already utf8
      detection = CharlockHolmes::EncodingDetector.detect(txt)
      txt = CharlockHolmes::Converter.convert txt, detection[:encoding], 'UTF-8' unless detection[:encoding] == 'UTF-8'

      @jmdict_txt = txt
    end
  end
end
