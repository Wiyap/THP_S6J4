class AddLikesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :like, :integer
  end
end
