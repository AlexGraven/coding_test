class AddRelationsBetweenUpdateAndUser < ActiveRecord::Migration
  def change
    add_reference :users, :update, index: true
  end
end
