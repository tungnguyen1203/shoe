class CheckOutController < ApplicationController
  def create
    product = Product.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      mode: 'payment',
      line_items: [{
        name: product.name,
        amount: product.price,
        currency: 'usd',
        quantity: 1
      }],
      success_url:root_url,
      cancel_url: root_url,
      })
      
    respond_to do |format|
      format.js
    end
  end
  
end
