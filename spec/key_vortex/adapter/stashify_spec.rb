# frozen_string_literal: true

require "tmpdir"
require "stashify/directory/local"

require "key_vortex/adapter/stashify"
require "key_vortex/contract"

RSpec.describe KeyVortex::Adapter::Stashify do
  around(:each) do |s|
    Dir.mktmpdir do |dir|
      @dir = dir
      s.run
    end
  end

  subject do
    KeyVortex::Adapter::Stashify.new(
      Stashify::Directory::Local.new(path: @dir)
    )
  end

  it_behaves_like "an adapter"
end
