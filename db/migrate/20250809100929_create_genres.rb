class CreateGenres < ActiveRecord::Migration[7.2]
  def change
    create_table :genres do |t|
      t.string :title
      t.text :genre
      t.string :image
      t.text :link

      t.timestamps
    end
  end
end
