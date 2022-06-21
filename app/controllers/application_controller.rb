class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :current_cart
  # binding.pry
  
    # return unless  current_user
    # @current_cart = Cart.find_or_create_by(user_id: current_user.id)
    
  
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    end
  
  private

    # def current_cart
      
    #   @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
    #   # if session[:cart_id]
       
    #   #   # if cart.present?
    #   #   #   @current_cart = cart
    #   #   # else
    #   #   #   session[:cart_id] = nil
    #   #   # end
    #   # end

    #   # if session[:cart_id] == nil
    #   #   @current_cart = Cart.create
    #   #   session[:cart_id] = @current_cart.id

    #   # end
    #   # if current_user.present?
    #   #   Cart.create(user_id: current_user.id)
    #   # end
    # end

end
