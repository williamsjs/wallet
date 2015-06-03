class Activity < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true
  validates :organization, presence: true

end
