class CreateRegCards < ActiveRecord::Migration
  def change
    create_table :reg_cards do |t|
      t.text :question
      t.text :answer
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
