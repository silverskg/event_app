class ChangeDatatypeCommentOfPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :user_id, :integer
    change_column :messages, :room_id, :integer
  end
end
