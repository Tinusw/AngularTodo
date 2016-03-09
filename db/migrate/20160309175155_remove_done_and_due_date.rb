class RemoveDoneAndDueDate < ActiveRecord::Migration
  def change
  	remove_column :items, :duedate
  	remove_column :items, :done
  end
end
