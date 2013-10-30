class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :user_id
      t.string :type
      t.integer :location_id
      t.text :description

      t.timestamps
    end
  end
end
