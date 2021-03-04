class CreateCheckoutLists < ActiveRecord::Migration[6.1]
  def change
    create_table :checkout_lists do |t|
      t.integer :group_id
      t.integer :user_id

      
    end
  end
end
