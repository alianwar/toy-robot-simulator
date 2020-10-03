# frozen_string_literal: true

module RobotsHelper
  def facing_options
    Robot.facings.collect { |key, value| [value.titleize, key] }
  end
end
