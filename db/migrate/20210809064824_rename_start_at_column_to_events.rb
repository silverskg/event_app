class RenameStartAtColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :start_at, :start_time
    rename_column :events, :end_at, :end_time
  end
end
