require 'helper'

class TestDisk < Test::Unit::TestCase

  def setup
    @path = '/tmp/keep-disk-test'
    @disk = Keep::Disk.new(@path)
  end

  def teardown
    `rm -rf #{@path}`
  end

  def test_path
    assert_equal @path, @disk.path
  end

  def test_touch
    assert File.exist?(@path)
  end

end
