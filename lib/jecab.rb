# encoding: UTF-8

require "jecab/version"
require "jecab/configuration"

module Jecab
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
