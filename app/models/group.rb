class Group < ApplicationRecord
    has_many :kpopidols
    has_many :checkout_lists
    has_many :users, through: :checkout_lists

    has_many :stans_for, class_name: "Group", foreign_key: "may_like_id"
    belongs_to :may_like, class_name: "Group" 
   
end
