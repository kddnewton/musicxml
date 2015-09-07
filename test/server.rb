require 'sinatra'
require 'pathname'

set :public_folder, File.dirname(__FILE__) + '/../lib/assets'

get '/' do
  @filepaths = Dir['samples/*.xml'].map { |filepath| Pathname(filepath).basename }
  erb :index
end

get '/parse' do
  filepath = Pathname('samples').join(params[:filepath])
  MusicXML::Parser.new(filepath).parse.to_json
end
