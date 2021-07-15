class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :provider, from: nil, to: ""
    change_column_default :users, :image_url, from: nil, to: ""
  end
end
