class ChangeColumnDefaultToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column_null :events, :date, null: false
  end
end
