class RemoveNamesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :names, :string
  end
end
