class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end
    def paid
      flash[:notice] = "Transaction completed"
      @order = Order.last
      @order.update_attribute(:status, "Paid by user: #{current_user.email} ")
  
    end
    
    def paypalPayment
      flash[:notice] = "Transaction completed"
      @order = Order.find(params[:id])
      @order.update_attribute(:status, "Paid with paypal")
  
    end
  
end
