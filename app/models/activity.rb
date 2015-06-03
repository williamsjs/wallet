class Activity < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true, numericality: true

  def self.total
    self.sum(:amount)
  end

  def self.transactions
    self.all.count
  end

  # def self.total_for_month
  #   activities = self.all
  #   activities.each do |activity|
  #
  # end

  #Activity.all.order(:amount).first
end
