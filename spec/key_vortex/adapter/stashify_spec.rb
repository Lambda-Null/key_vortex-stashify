# frozen_string_literal: true

require "tmpdir"
require "stashify/directory/local"

require "key_vortex/adapter/stashify"
require "key_vortex/contract"

RSpec.describe KeyVortex::Adapter::Stashify do
  around(:each) do |s|
    Dir.mktmpdir do |dir|
      @dir = dir
      @stashify = Stashify::Directory::Local.new(path: @dir)
      s.run
    end
  end

  subject { KeyVortex::Adapter::Stashify.new(@stashify) }

  it_behaves_like "an adapter", stashify: @stashify
end
