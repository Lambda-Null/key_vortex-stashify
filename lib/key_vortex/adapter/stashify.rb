# frozen_string_literal: true

require "json"

require "key_vortex/adapter"
require "key_vortex/record"
require "stashify/file"

class KeyVortex
  class Adapter
    class Stashify < KeyVortex::Adapter
      def self.build(stashify:)
        new(stashify)
      end

      def initialize(stashify)
        super()
        @stashify = stashify
      end

      def save(record)
        @stashify.write(
          ::Stashify::File.new(
            name: record.key,
            contents: JSON.generate(record)
          )
        )
      end

      def find(key)
        return unless @stashify.exists?(key)

        JSON.parse(@stashify.find(key).contents, create_additions: true)
      end

      def remove(key)
        @stashify.delete(key)
      end
    end
  end
end

KeyVortex.register(KeyVortex::Adapter::Stashify)
