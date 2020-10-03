FactoryBot.define do
  factory :robot do
    position_x { Random.rand(5) }
    position_y { Random.rand(5) }
    facing { Robot.facings.keys.sample }
  end
end
