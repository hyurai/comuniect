class Comment < ApplicationRecord
    belongs_to :infomation
    belongs_to :user
    has_many :answers
    belongs_to :comment
end
