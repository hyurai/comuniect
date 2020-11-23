class Favorite < ApplicationRecord
    belongs_to :infomation
    belongs_to :user
    validates :infomation_id, presence: true 
    validates :user_id, presence: true
end
