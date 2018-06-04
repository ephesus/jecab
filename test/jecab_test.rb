# encoding: UTF-8

require 'test_helper'

class JecabTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jecab::VERSION
  end

  def setup
    Jecab.configure do |c|
      c.jmdict_txt = File.read(File.join(Jecab.root, 'test', 'edict2-test.txt'))
    end
  end

  def test_configuration_created
    refute Jecab.configuration.nil?
  end
  
  def test_fix_wrong_encoding
    euc_txt = File.read(File.join(Jecab.root, 'test', 'edict2-euc-jp.txt'))
    #infile is EUC-JP
    assert_equal 'EUC-JP', ::CharlockHolmes::EncodingDetector.detect(euc_txt)[:encoding]

    #imported it's UTF-8
    Jecab.configure do |c|
      @jmdict_txt = euc_txt
    end

    assert_equal 'UTF-8', ::CharlockHolmes::EncodingDetector.detect(Jecab.configuration.jmdict_txt)[:encoding]
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

  def test_parser_object
    parser = ::Jecab.parse("請求項１を引用する請求項２－２３，請求項２４を引用する請求項２５－３７についても同様である")

    assert_instance_of ::Jecab::Parser, parser
    refute parser.instance_variable_get(:@string).nil?
  end
end
