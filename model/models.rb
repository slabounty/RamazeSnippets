#
# This is the model for the authors and is backed by the :authors table in the
# database. 
#
# Create the Author model. 
class Snippet < Sequel::Model 
    def to_s
        "body: #{body} created_at: #{created_at}"
    end
end
