# frozen_string_literal: true

module Solargraph
  module StdlibFills
    Override = Pin::Reference::Override

    LIBS = {
      'benchmark' => [
        Override.method_return('Benchmark.measure', 'Benchmark::Tms')
      ],

      'pathname' => [
        Override.method_return('Pathname#join', 'Pathname'),
        Override.method_return('Pathname#basename', 'Pathname'),
        Override.method_return('Pathname#dirname', 'Pathname'),
        Override.method_return('Pathname#cleanpath', 'Pathname'),
        Override.method_return('Pathname#children', 'Array<Pathname>'),
        Override.method_return('Pathname#entries', 'Array<Pathname>')
      ]
    }

    def self.get path
      LIBS[path] || []
    end
  end
end
