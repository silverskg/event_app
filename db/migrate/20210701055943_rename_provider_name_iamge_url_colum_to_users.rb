class RenameProviderNameIamgeUrlColumToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :name,false, 0
    change_column_null :users, :image_url, false, 0
  end
end
