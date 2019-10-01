class ChangeLikesToBeIntegerInBlogs < ActiveRecord::Migration[5.1]
  def change
    change_column :blogs, :likes, 'integer USING CAST(likes AS integer)'
  end
end
