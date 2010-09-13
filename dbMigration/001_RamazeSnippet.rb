# Sequel migration that creates the books, authors, authors_books, 
# and users tables for the library.
Class.new(Sequel::Migration) do
    def up
        create_table(:snippets) do
            primary_key :id
            String :title 
            String :body 
            DateTime :created_at
        end
    end

    def down
        drop_table(:snippet)
    end
end

