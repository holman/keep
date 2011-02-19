require 'helper'

class TestKeep < Test::Unit::TestCase

  def setup
    @path = '/tmp/keep-yaml-test'
    @yaml = Keep::Yaml.new(@path)
  end

  def teardown
    `rm -rf #{@path}`
  end

  def test_set
    @yaml.set('cute', 'ellen page')
    assert_equal "--- \ncute: ellen page", File.read(@path).chomp
  end

  def test_get_symbol
    @yaml.set('cute', 'ellen page')
    assert_equal 'ellen page', @yaml.get(:cute)
  end

  def test_get_string
    @yaml.set('cute', 'ellen page')
    assert_equal 'ellen page', @yaml.get('cute')
  end

  def test_present
    assert !@yaml.present?('cute')
    @yaml.set('cute', 'ellen page')
    assert @yaml.present?('cute')
  end

  def test_keys
    @yaml.set('cute', 'ellen page')
    @yaml.set('hot',  'elisha cuthbert')
    assert_equal %w(hot cute), @yaml.keys
  end

end
