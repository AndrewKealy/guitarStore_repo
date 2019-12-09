class CartController < ApplicationController
  
  def add
   # session.delete(:cart)
    #Get id of product
    id = params[:id]
    # if the cart has already been created, use existing cart, otherwise create a blank cart
    if session[:cart] then
      cart= session[:cart]
    else 
      session[:cart] = {}
      cart= session[:cart]
    end
    # If product is already added , increment  it by one, else add it
    if cart[id] then 
      cart[id]+=1
    else 
      cart[id]=1
    end
     
    redirect_to :action=> :index
    
  end
  def remove
  
    id =params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :action => :index
  end
  
  
  def decrease
    id = params[:id]
    cart = session[:cart]
    if cart[id]==1 then 
      cart.delete id
    else 
      cart[id]= cart[id]-1
    end
    redirect_to :action => :index
    
  end
  
  

  def index
    if session[:cart] then 
      @cart = session[:cart]
    else 
      @cart = {}
    end
  end
  

end
