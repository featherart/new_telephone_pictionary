class AddAcceptedtoPlayer < ActiveRecord::Migration
  def change
    add_column :player, :joined, :boolean
    add_column :player, :time_start, :timestamp
  end
end
