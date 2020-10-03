# frozen_string_literal: true

class Robot < ApplicationRecord
  include CommandConcern

  enum facings: FACINGS

  validates :position_x, :position_y, :facing, presence: true
  validates :position_x,
            :position_y,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: UNITS[:min],
              less_than: UNITS[:max]
            }
end
