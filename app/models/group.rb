class Group < ApplicationRecord
    has_many :kpopidols
    has_many :checkout_lists
    has_many :users, through: :checkout_lists

    has_many :referalls, class_name: "Group",
    foreign_key: "recommendation_id"

    belongs_to :recommendation, class_name: "Group", optional: true

    def self.main_group
        self.where({ name: ["Stray Kids", "Monsta X", "BigBang", "NCT 127", "Got7"]})
    end

    def self.recommended_groups
        self.referalls
    end

    

   
end
