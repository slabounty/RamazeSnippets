#
# This is the model for the snippets and is backed by the :snippets table in the
# database. 
#
# Create the Snippet model. 
class Snippet < Sequel::Model 

    # Used for debugging if necessary. Simply print out thd body and 
    # the time the snippet was created.
    def to_s
        "body: #{body} created_at: #{created_at}"
    end
end
