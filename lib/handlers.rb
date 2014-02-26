require "rdiscount"

ActionView::Template.register_template_handler :md,

lambda { |template| "RDiscount.new(#{template.source.inspect}).to_html" }

