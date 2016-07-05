require 'test_helper'

class JecabTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jecab::VERSION
  end

  def setup
    Jecab.configure do |c|
    end
  end

  def test_configuration_created
    refute Jecab.configuration.nil?
  end

  def test_configuration_defaults
    assert Jecab.configuration.formatting[:harvard_comma]
    refute Jecab.configuration.formatting[:dot_separator]
    refute Jecab.configuration.formatting[:capitalize_claims]
  end

  def test_configuration_is_set
    Jecab.configure do  |c|
      c.formatting[:new_configuration] = true  
    end

    assert Jecab.configuration.formatting[:new_configuration]
  end
end
