class AddTicketsCountToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :tickets_count, :integer
  end
end
