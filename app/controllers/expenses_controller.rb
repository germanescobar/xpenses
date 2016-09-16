class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
     @expenses = Expense.order("date DESC")
  end
end
