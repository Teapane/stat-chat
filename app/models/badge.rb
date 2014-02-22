class Badge

  attr_reader :name, :image

  def initialize(attributes)
    @name = attributes[:name]
    @image = attributes[:image]
  end

end
