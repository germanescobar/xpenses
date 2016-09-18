class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
     @user = current_user
     @expenses = @user.expenses.order("date DESC")

     if !params[:category_id].blank?
       @expenses = @expenses.where(category_id: params[:category_id])
     end

     if !params[:concept].blank?
       @expenses = @expenses.where("concept like :query", query: "%#{params[:concept]}%")
     end

  end
end
