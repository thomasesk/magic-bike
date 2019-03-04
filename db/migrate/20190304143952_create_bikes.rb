class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :country
      t.boolean :helmet
      t.boolean :locker
      t.boolean :rack
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
