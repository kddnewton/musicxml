require 'forwardable'
require 'json'
require 'nokogiri'

require 'musicxml/node/config'
require 'musicxml/node/json_export'
require 'musicxml/node/base'
require 'musicxml/node/parser'

require 'musicxml/node'
require 'musicxml/node/key'
require 'musicxml/node/note'
require 'musicxml/node/score_partwise'
require 'musicxml/key_signature'

require 'musicxml/parser'

require 'lilypond/converter'
require 'lilypond/runner'
require 'lilypond/version'

module MusicXML
  def self.compile_js
    %w[sprockets uglifier pathname].each do |library|
      require library
    end

    root = Pathname('lib/assets')
    env = Sprockets::Environment.new(root)

    env.append_path('src')
    env.js_compressor = Uglifier.new(mangle: true)

    asset = env.find_asset('main.js')
    asset.write_to(root.join('musicxml-min.js'))
  end
end
