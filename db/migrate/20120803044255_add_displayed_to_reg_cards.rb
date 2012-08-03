class AddDisplayedToRegCards < ActiveRecord::Migration
  def change
    add_column :reg_cards, :displayed, :boolean, default: false
  end
end
