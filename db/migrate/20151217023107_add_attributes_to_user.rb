class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :nsid, :string
    add_column :users, :iconserver, :string
    add_column :users, :iconfarm, :string
  end
end
