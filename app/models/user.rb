class User < ApplicationRecord
    has_many :biaslists
    has_many :kpopidols, through: :biaslists 

    has_many :groups, through: :checkout_lists

    has_secure_password
    validates :username, uniqueness: true
end
