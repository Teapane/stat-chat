class Badge

  attr_reader :name, :image, :description, :username

  def initialize(attributes)
    @name = attributes[:name]
    @image = attributes[:image]
    @description = attributes[:description]
    @username = attributes[:username]
  end

end
