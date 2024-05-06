class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.string :location
      t.decimal :price_per_day
      t.string :type
      t.integer :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
