class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, foreign_key: true
      t.references :bike, foreign_key: true
      t.integer :price
      t.integer :pax

      t.timestamps
    end
  end
end
