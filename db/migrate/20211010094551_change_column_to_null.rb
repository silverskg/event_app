class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :messages, :user_id, true
    change_column_null :messages, :room_id, true
  end
end
