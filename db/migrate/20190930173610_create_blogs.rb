class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :likes

      t.timestamps
    end
  end
end
