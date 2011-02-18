require 'helper'

class TestKeeps < Test::Unit::TestCase

  def setup
    @path = '/tmp/keep-test'
    @keep = Keep.new(@path)
  end

  def teardown
    `rm -rf #{@path}`
  end

  def test_path
    assert_equal @path, @keep.path
  end

  def test_as
    assert_equal 'yaml', @keep.as('yaml')
  end

end
