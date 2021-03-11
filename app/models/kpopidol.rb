class Kpopidol < ApplicationRecord
    belongs_to :group
    has_many :biaslists
    has_many :users, through: :biaslists
end
