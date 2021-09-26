# frozen_string_literal: true

# Player class that generates players
class Player
  attr_reader :name, :mark
  attr_accessor :choice

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end
