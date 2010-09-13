require 'rubygems'
require 'sequel'

# Open the library's database. This must be done before we access the models
# that use it.
Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://snippets.sqlite')

# Here go your requires for models:
require 'model/models'
