# encoding: UTF-8

require "jecab/version"
require "jecab/configuration"
require "jecab/parser"

module Jecab
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.parse(string)
    Jecab::Parser.new(string)
  end
end

