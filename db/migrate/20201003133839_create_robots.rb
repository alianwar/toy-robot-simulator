class CreateRobots < ActiveRecord::Migration[6.0]
  def change
    create_table :robots do |t|
      t.integer :position_x, null: false, default: ''
      t.integer :position_y, null: false, default: ''
      t.string :facing, null: false, default: ''

      t.timestamps
    end
  end
end
