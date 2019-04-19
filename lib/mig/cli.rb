require "thor"
require "mig"

module Mig
  class CLI < Thor
    desc "hello <NAME>", "Says hi back to you"
    def hello(name)
      puts "hello #{name}"
    end
  end
end
