# frozen_string_literal: true

require "json"

require "key_vortex/adapter"
require "key_vortex/record"
require "stashify/file"

class KeyVortex
  class Adapter
    # Implements a {https://rubydoc.info/gems/key-vortex/KeyVortex/Adapter KeyVortex Adapter}
    # for {https://rubydoc.info/gems/stashify/Stashify/Directory Stashify Directories}.
    # Sometimes file storage is all that's needed, going fancier just
    # isn't necessary. By supporting Stashify's API, development can be
    # done against local storage, but production systems can use the
    # Blob storage for whatever provider makes the most sense.
    class Stashify < KeyVortex::Adapter
      # @param stashify [Stashify::Directory] The Stashify Directory which should be used
      # @return [KeyVortex::Adapter::Stashify]
      def self.build(stashify:)
        new(stashify)
      end

      # @param stashify [Stashify::Directory] The Stashify Directory which should be used
      def initialize(stashify)
        super()
        @stashify = stashify
      end

      # Write a record to the directory with the filename record.key
      # and a json version of the record as its contents.
      # @param record [KeyVortex::Record] The record to be saved
      def save(record)
        @stashify.write(
          ::Stashify::File.new(
            name: record.key,
            contents: JSON.generate(record)
          )
        )
      end

      # Load the file with filename key, assuming that the contents of
      # the file are a json version of the record.
      # @param key [String]
      # @return [KeyVortex::Record]
      # @return [nil] if the file does not exist
      def find(key)
        return unless @stashify.exists?(key)

        JSON.parse(@stashify.find(key).contents, create_additions: true)
      end

      # Delete the file with filename key
      # @param key [String]
      def remove(key)
        @stashify.delete(key)
      end
    end
  end
end

KeyVortex.register(KeyVortex::Adapter::Stashify)
