class Keep
  class Yaml < Disk

    # The in-memory data structure representing the configuration you're
    # keeping. Implemented by child classes.
    #
    # Returns a Hash of configuration keys and values.
    def data
      @data ||= YAML::load_file(path) || {}
    end

    # Persists the in-memory hash to disk. Implemented by child classes.
    #
    # Returns whether the save was successful.
    def save
      File.open(path, 'w') do |out|
        YAML.dump(data, out)
      end
    end

  end
end
