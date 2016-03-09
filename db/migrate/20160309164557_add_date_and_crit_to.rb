class AddDateAndCritTo < ActiveRecord::Migration
  def change
  	add_column :items, :duedate, :string
  	add_column :items, :crit, :integer
  end
end
