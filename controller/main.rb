# controllers/main.rb
#
# The MainController has methods for index/main (to create a new snippet) and show (to show
# an existing snippet).

# Require syntaxi for syntax highlighting.
require 'syntaxi'
Syntaxi::line_number_method = 'floating'
Syntaxi::wrap_enabled = false
Syntaxi::wrap_at_column = 120

class MainController < Controller

    # The main/index page that shows a text area where we can put in a 
    # title and a snippet. We'll grab the title and snippet text, create a new
    # snippet, and then go to the snippet display page to see it.
    def index
        @title = "Snippet!"

        # We've got a post, so grab the title and the snippet and then create
        # a new Snippet with them and the current time. We'll then go ahead and 
        # redirect to the show method with the id that we get from the snippet.
        if  request.post?
            title = request[:title]
            snippet_text = request[:snippet]
            snippet = Snippet.create(:title => title, :body => snippet_text, :created_at => Time.now)
            redirect rs(:show, snippet.id)
        end
    end

    # The show page that shows an existing snippet. It takes the id of an existing 
    # snippet and if it exists shows it nicely highlighted. If it doesn't exist, we'll
    # just go back to the main page after setting the flash.
    def show(id)
        @title = "Show Snippet!"

        # Find the snippet if it exists
        @snippet = Snippet[id]

        if @snippet != nil
            # Get some text we can use to substitute for the "[/code]" text so that it doesn't
            # mess up Syntaxi.
            replacer = Time.now.strftime('[code-%d]')

            # Do the syntax highlighting of the text with Syntaxi after we've done our
            # substitution.
            @snippet_highlight = Syntaxi.new("[code lang='ruby']#{@snippet.body.gsub('[/code]', replacer)}[/code]").process

            # Substitute the '[/code]' back in for our replacement text.
            @snippet_highlight = "#{@snippet_highlight.gsub(replacer, '[/code]')}"
        else
            # The snippet doesn't exist, so set a message and just redirect
            # to the main/index page.
            flash[:message] = "Snippet #{id} not found."
            redirect rs :index
        end
    end
end
