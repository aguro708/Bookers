class BookComment < ApplicationRecord
	belongs_to :book
	belongs_to :user
	validates :comment, presence: true
	validates :comment, length: {maximum:50}
end
