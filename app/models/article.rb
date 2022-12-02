class Article < ApplicationRecord
	has_many :comments

	validates :heading, presence: true
	validates :data, presence: true, length: {minimum:5, maximum:100}
end
