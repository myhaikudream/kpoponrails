class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_name
      t.string :debut_date
      t.string :fandom_name
      t.string :instagram
      t.string :twitter
      t.string :youtube
      t.string :group_img
      t.string :music_video
      t.string :live_video
      t.string :dance_video
      t.references :recommendation, foreign_key: { to_table: :groups }

    end
  end
end
