class CreateWaves < ActiveRecord::Migration
  def change
    create_table :waves do |t|
      t.string :post
      t.integer :user_id

      t.timestamps
    end
  end
end
