class Activity < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true, numericality: true

  def self.total
    self.sum(:amount)
  end

  def self.transactions
    self.all.count
  end

  def self.total_month
    current_month = Time.now.month
    activities_for_month = Activity.all.map {|a| a.amount if a.created_at.month == current_month}
    activities_for_month.reduce(:+)
  end

  def self.total_previous_month
    previous_month = Time.now.month - 1
    activities_for_month = Activity.all.map {|a| a.amount if a.created_at.month == previous_month}
    if activities_for_month.all? {|a| a== nil}
      return 0
    else
      activities_for_month.reduce(:+)
    end
  end

  def self.most_expensive
    Activity.all.order(:amount).first.amount
  end

end
