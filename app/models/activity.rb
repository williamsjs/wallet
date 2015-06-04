class Activity < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true, numericality: true

  def self.balance
    self.sum(:amount)
  end

  def self.transactions
    self.all.count
  end

  def self.transactions_month
    current_month = Time.now.month
    transactions_for_month = Activity.all.map {|a| a if a.created_at.month == current_month}
    if transactions_for_month.all? {|a| a==nil}
      return 0
    else
      transactions_for_month.count
    end
  end

  def self.transactions_previous_month
    current_month = Time.now.month - 1
    transactions_previous_month = Activity.all.map {|a| a if a.created_at.month == current_month}
    if transactions_previous_month.all? {|a| a==nil}
      return 0
    else
      transactions_previous_month.count
    end
  end

  def self.total_month
    current_month = Time.now.month
    activities_for_month = Activity.all.map {|a| a.amount if a.created_at.month == current_month && a.amount < 0 }
    activities_for_month = activities_for_month.reject {|a|a==nil}
    total = activities_for_month.reduce(:+)
    total.abs unless total.nil?
  end

  def self.total_previous_month
    previous_month = Time.now.month - 1
    activities_for_month = Activity.all.map {|a| a.amount if a.created_at.month == previous_month && a.amount < 0}
    if activities_for_month.all? {|a| a== nil}
      0
    else
      activities_for_month.reduce(:+)
    end
  end

  def self.most_expensive_for_month
    current_month = Time.now.month
    activities_for_month = Activity.all.map {|a| a.amount if a.created_at.month == current_month}
    most_expensive = activities_for_month.sort.first
    most_expensive.abs unless most_expensive.nil?
  end

  def self.most_expensive
    expensive = Activity.all.order(:amount).first.amount unless Activity.count == 0
    return expensive.abs unless expensive.nil?
    0
  end

end
