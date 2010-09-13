require 'rubygems'
require 'sequel'

# Open the employee database. This must be done before we access the models
# that use it.
DB = Sequel.sqlite("snippets.sqlite")


# Here go your requires for models:
require 'model/models'
