class ChangeEventsColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image, :string
  end
end
