class CreateBasketItems < ActiveRecord::Migration[5.0]
  def change
    create_table :basket_items do |t|
      t.references :basket, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
