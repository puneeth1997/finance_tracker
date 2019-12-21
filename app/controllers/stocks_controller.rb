class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'you have entered empty string'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'you have entered incorrect symbol' unless @stock
    end
    respond_to do |format|
        format.js { render partial: 'users/result' }
    end 
  end

end
