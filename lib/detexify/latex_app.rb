require 'armchair'
require 'classinatra/client'
require 'latex/symbol'
require 'detexify/base'

module Detexify
  
  class LatexApp < Base
    set :classifier, Classinatra::Client.at(ENV['CLASSIFIER'] || 'http://104.131.30.83:3000')
    set :couch, Armchair.new(ENV['COUCH'] || 'http://kirelabs.cloudant.com/detexify')
    set :symbols, Latex::Symbol::ExtendedList
  end
  
end