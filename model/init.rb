require 'rubygems'
require 'sequel'

# Open the snippets's database. This must be done before we access the models
# that use it.
Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://snippets.sqlite')

# All of the models are defined in this next file.
require 'model/models'
