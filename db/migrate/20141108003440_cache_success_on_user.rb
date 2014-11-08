class CacheSuccessOnUser < ActiveRecord::Migration
  def change
    add_column :users, :succeeded, :boolean
  end
end
