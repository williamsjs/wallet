class Activity < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true, numericality: true

  def self.total
    self.sum(:amount)
  end

  def self.transactions
    self.all.count
  end

end
