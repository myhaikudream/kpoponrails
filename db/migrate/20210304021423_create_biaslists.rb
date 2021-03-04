class CreateBiaslists < ActiveRecord::Migration[6.1]
  def change
    create_table :biaslists do |t|
      t.integer :kpopidol_id
      t.integer :user_id
      t.string :notes

     
    end
  end
end
