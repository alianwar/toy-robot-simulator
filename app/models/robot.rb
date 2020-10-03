# frozen_string_literal: true

class Robot < ApplicationRecord
  FACINGS = {
    north: 'north',
    east: 'east',
    south: 'south',
    west: 'west'
  }.freeze

  TOWARDS = {
    right: 1,
    left: -1
  }

  enum facings: FACINGS

  validates :position_x, :position_y, :facing, presence: true
  validates :position_x,
            :position_y,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              less_than: 5
            }

  def move!
    update(move_to[facing.to_sym])
  end

  def left!
    update(facing: directions[TOWARDS[:left]])
  end

  def right!
    update(facing: directions[TOWARDS[:right]])
  end

  def place!(position_x, position_y, facing)
    update(position_x: position_x, position_y: position_y, facing: facing)
  end

  def report
    "Robot is currently placed at: (#{position_x}, #{position_y}) facing #{facing.titleize}"
  end

  private

  def move_to
    {
      north: { position_y: position_y + 1 },
      east: { position_x: position_x + 1 },
      south: { position_y: position_y - 1 },
      west: { position_x: position_x - 1 }
    }
  end

  def directions
    FACINGS.keys.rotate(FACINGS.keys.index(facing.to_sym))
  end
end
