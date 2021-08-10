class RenameStartTimeColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :date, null: :false
  end
end
