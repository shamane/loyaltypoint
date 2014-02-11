class CreatePointLineItems < ActiveRecord::Migration
  def change
    create_table :point_line_items do |t|
      t.integer :user_id
      t.string :points
      t.string :source

      t.date :created_at
    end
  end
end
