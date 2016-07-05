# encoding: UTF-8

# Configuration object, singleton, class variable

module Jecab
  class Configuration
    attr_accessor :formatting
    
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
  end
end
