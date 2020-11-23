class Infomation < ApplicationRecord
    has_many :comments
    has_many :answers
    belongs_to :user,dependent: :destroy,optional: true
    has_many :favorites
end
