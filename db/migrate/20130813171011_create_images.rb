class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :location
      t.references :product, index: true

      t.timestamps
    end
  end
end
