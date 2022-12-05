class Article < ApplicationRecord
	include Visible
	has_many :comments, dependent: :destroy 

	validates :heading, presence: true
	validates :data, presence: true, length: {minimum:5, maximum:100}
end


