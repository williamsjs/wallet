class Activity < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true, numericality: true

end
