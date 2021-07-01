class SessionsController < Devise::SessionsController
  #POST/resoursce/sign_in
 
  def create
    super
    
    
      session[:user_id] = user.id
      cookies.signed[:user_id] = user.id
      
  end
  
  def destroy
    super
    session[:user_id] = nil
    
    
  end
end