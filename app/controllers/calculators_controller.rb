class CalculatorsController < ApplicationController

  def index
    #raise Dir.pwd
    markdown = File.open("app/assets/markdown/score_calculator.markdown", "r").read
    @display_text = BlueCloth.new(markdown).to_html
  end

end
