class SessionsController < ApplicationController

  skip_before_action :authorize

  def new
  end

  def createfb
    if params[:error] == "access_denied"
      redirect_to root_url  
    end  

    user = User.from_omniauth(env["omniauth.auth"])
    unless user.blank?
      session[:user_id] = user.id
      session[:uname] = user.username
      session[:rol_id] = user.rol_id
       
      #variables de rol
      rol =Rol.find_by(id: user.rol_id)
      session[:mod0] =rol.admin
      session[:mod1] =rol.module_1
      session[:mod2] =rol.module_2
      session[:mod3] =rol.module_3
      session[:mod4] =rol.module_4
      session[:mod5] =rol.module_5
      redirect_to root_url
    else
      redirect_to root_url ,notice: 'ya existe una cuenta con ese email asignado'  
    end
  end  

  def create
  	user = User.find_by(username: params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
      session[:uname] = params[:username]
  		session[:rol_id] = user.rol_id

      #variables de rol
      rol =Rol.find_by(id: user.rol_id)
      session[:mod0] =rol.admin
      session[:mod1] =rol.module_1
      session[:mod2] =rol.module_2
      session[:mod3] =rol.module_3
      session[:mod4] =rol.module_4
      session[:mod5] =rol.module_5
      #termina variables de rol

  		redirect_to session[:lasurl]
  	else
  		redirect_to login_path, alert: "Invalid user/password combination"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path, alert: "Logged out"
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
