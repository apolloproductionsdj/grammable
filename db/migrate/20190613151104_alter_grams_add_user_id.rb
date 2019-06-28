class AlterGramsAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :grams, :user_id
  end
end
