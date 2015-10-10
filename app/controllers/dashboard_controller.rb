class DashboardController < ApplicationController
  before_filter :require_user

  def index
    @transactions = Transaction.group(:transaction_date).where('amount <? AND transaction_date >=?', 0, 1.week.ago).sum(:amount)
#     @transactions = Transaction.group(:transaction_date).where('amount < ? AND MONTH(transaction_date) = ? ' ,0, Time.now.month).sum(:amount)
  end
end
