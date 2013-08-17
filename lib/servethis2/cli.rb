require "optparse"
require "servethis2/server"
require "servethis2/version"

module Servethis2
  class CLI
    def default_options
      {
        :Port => 8000,
        :DocumentRoot => ".",
        :ServerSoftware => "Servethis2/#{Servethis2::VERSION} " +
                            "(Ruby/#{RUBY_VERSION}/#{RUBY_RELEASE_DATE})"
      }
    end

    def options
      @options ||= default_options
    end

    def optparse!
      OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} [doc_root] [-p port]"

        opts.on("-p", "--port PORT", "Use specified port") do |p|
          options[:Port] = p
        end
      end.parse!

      options[:DocumentRoot] = ARGV[0] if ARGV[0]
    end

    def run
      optparse!
      Server.new(options).start
    end

    def self.run
      self.new.run
    end
  end
end
