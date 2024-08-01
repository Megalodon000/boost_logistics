class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :origin
      t.string :destination
      t.date :shipment_date
      t.string :shipment_type
      t.decimal :weight
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.text :special_instructions
      t.string :status

      t.timestamps
    end
  end
end
