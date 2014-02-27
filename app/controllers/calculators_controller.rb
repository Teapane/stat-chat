class CalculatorsController < ApplicationController

  def index
    markdown = "
                def something
                  puts 'hello'
                end"
    @display_text = BlueCloth.new(markdown).to_html
  end

end
