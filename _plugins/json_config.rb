require 'json'

module Jekyll
  class JsonConfig < Plugin
    def self.load_config(path)
      if File.exist?(path)
        config = JSON.parse(File.read(path))
        config.transform_keys(&:to_s)
      else
        {}
      end
    end
  end

  # Hook into Jekyll's configuration loading
  Jekyll::Hooks.register :site, :after_init do |site|
    if File.exist?('_config.json')
      json_config = JsonConfig.load_config('_config.json')
      site.config.merge!(json_config)
    end
  end
end
