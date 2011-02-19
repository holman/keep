# Keep::Disk is our hook into your system. We'll save and open files here.
#
# Pretty cool, amirite?
class Keep
  class Disk

    # The path to save the file.
    #
    # Returns a String path to the file.
    attr_reader :path

    # The path to save the file.
    #
    #   path - String file path (relative or absolute) destination
    #
    # Returns a String path to the file.
    attr_writer :path

    # Creates a new Disk instance.
    #
    # Returns nothing.
    def initialize(path)
      @path = path
      touch
    end

    # Ensures the destination file is created.
    #
    # Returns nothing.
    def touch
      FileUtils.touch(path)
    end

    # The in-memory data structure representing the configuration you're
    # keeping. Implemented by child classes.
    #
    # Returns a Hash of configuration keys and values.
    def data ; end

    # Persists the in-memory hash to disk. Implemented by child classes.
    #
    # Returns whether the save was successful.
    def save ; end

    # Sets a value to a given key. Updates the in-memory hash, and then saves.
    #
    #   key - a String value for the key of this Hash
    #   value - an Object that maps to the key, will be serialized
    #
    # Returns whether the save was successful.
    def set(key,value)
      data[key.to_s] = value
      save
    end

    # Returns the value of the specified key.
    #
    #   key - a String value for the key of this Hash
    #
    # Returns the value if found, otherwise nil.
    def get(key)
      data[key.to_s]
    end

    # Accesses all of the keys we're keeping.
    #
    # Returns an Array of Objects.
    def keys
      data.keys
    end

    # Searches for the key in the in-memory Hash.
    #
    # Returns whether or not the key is present.
    def present?(key)
      !get(key).nil?
    end

  end
end
