$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require 'fileutils'
require 'yaml'

require 'keep/disk'
require 'keep/yaml'

class Keep
  VERSION = '0.0.2'

  # The path to the configuration file.
  attr_reader :path

  # The in-memory Disk object.
  attr_reader :disk

  # The configuration format outputted.
  attr_reader :format

  # The path to the configuration file.
  #
  #   path - a String file path (absolute or relative)
  #
  # Returns a String.
  attr_writer :path

  # A reference to the in-memory Disk object.
  attr_writer :disk

  # The format of the configuration output.
  attr_writer :format


  # Initialize a new Keep instance.
  #
  #   path - the String file path to save configuration to
  #
  # Returns nothing.
  def initialize(path)
    @path = path
    @disk = Yaml.new(path)
  end

  # The format of configuration output.
  #
  #   format - the lowercase String representation of a class inheriting Disk
  #
  # Returns nothing, defaults to 'yaml' right now.
  def as(format)
    @format = 'yaml'
  end

  # Sets a value to a given key.
  #
  #   key - a String value for the key of this Hash
  #   value - an Object that maps to the key, will be serialized
  #
  # Returns whether the save was successful. 
  def set(key,value)
    @disk.set(key,value)
  end

  # Returns the value of the specified key.
  #
  #   key - a String value for the key of this Hash
  #
  # Returns the value if found, otherwise nil.
  def get(key)
    @disk.get(key)
  end

  # Searches for the key in the in-memory Hash.
  #
  # Returns whether or not the key is present.
  def present?(key)
    @disk.present?(key)
  end

  # Accesses all of the keys we're keeping.
  #
  # Returns an Array of Objects.
  def keys
    @disk.keys
  end

end
