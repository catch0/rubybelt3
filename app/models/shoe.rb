class Shoe < ActiveRecord::Base
  belongs_to :user
	has_many :purchases, dependent: :destroy

	validates :name, presence: true
	validates :amount, presence: true

	before_save :default_values
	def default_values
		self.purchased ||= "false"
	end
end
