class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :image
      t.string :title
      t.date :publication_date

      t.timestamps
    end
  end
end
