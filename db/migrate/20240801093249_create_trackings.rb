class CreateTrackings < ActiveRecord::Migration[7.1]
  def change
    create_table :trackings do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :status
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
