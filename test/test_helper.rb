$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'jecab'

require 'charlock_holmes'

require 'minitest/autorun'
require 'minitest/pride'

module Jecab
  extend self 

  def root
    File.join(File.dirname(__dir__)) #ruby 2.0+
  end
end
