class CreateKpopidols < ActiveRecord::Migration[6.1]
  def change
    create_table :kpopidols do |t|
      t.string :stage_name
      t.string :birth_name
      t.string :birthday
      t.string :birth_place
      t.string :height
      t.string :position
      t.string :nickname
      t.string :famous_quote
      t.string :member_img
      t.string :fan_cam
      t.integer :group_id

      
    end
  end
end
