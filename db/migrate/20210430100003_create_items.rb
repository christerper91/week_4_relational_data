class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :product, foreign_key: true
      t.string :name
      t.integer :qty
      t.decimal :unit_price

      t.timestamps
    end
  end
end
