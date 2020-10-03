# frozen_string_literal: true

module CommandConcern
  extend ActiveSupport::Concern

  included do
    FACINGS = {
      north: 'north',
      east: 'east',
      south: 'south',
      west: 'west'
    }.freeze

    UNITS = {
      max: 5,
      min: 0
    }.freeze

    TOWARDS = {
      right: 1,
      left: -1
    }.freeze
  end

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
