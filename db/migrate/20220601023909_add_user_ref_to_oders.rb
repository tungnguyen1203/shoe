class AddUserRefToOders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :users, foreign_key: true
  end
end
