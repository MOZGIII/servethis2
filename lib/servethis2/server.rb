require "rack"
require "rack/nocache"

module Servethis2
  class Server
    attr_reader :options

    def initialize(options = {})
      @options = options
      prepare
    end

    def prepare
      doc_root = options[:DocumentRoot].gsub(::File::ALT_SEPARATOR, ::File::SEPARATOR)
      puts "Working with #{doc_root}"
      puts "Warning! Path does not exist!" unless Dir.exists? doc_root

      builder = Rack::Builder.new do
        use Rack::CommonLogger
        use Rack::ShowExceptions
        use Rack::Nocache

        run Rack::File.new(doc_root)
      end

      options[:app] = builder
    end


    def start
      Rack::Server.start(options)
    end
  end
end
