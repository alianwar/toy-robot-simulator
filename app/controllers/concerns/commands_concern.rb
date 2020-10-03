# frozen_string_literal: true

module CommandsConcern
  extend ActiveSupport::Concern

  def move
    @robot.move!
  end

  def left
    @robot.left!
  end

  def right
    @robot.right!
  end

  def report; end
end
