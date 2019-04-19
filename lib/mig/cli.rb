require "thor"
require "mig"

module Mig
  class CLI < Thor
    map %w[--version -v] => :__print_version

    desc "--version, -v", "print the version"
    def __print_version
      puts Mig::VERSION
    end

    desc "indices", "list the indices"
    def indices
      client = Elasticsearch::Client.new
      puts client.indices
    rescue => err
      puts err.message
    end
  end
end
