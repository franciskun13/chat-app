class SessionsController < ApplicationController

    before_action :logged_in_redirect, only: [:new, :create]

    def new
        redirect_to chatroom_path if logged_in?
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            session[:username] = user.username    
            flash[:notice] = "Logged in successfully" 
            redirect_to chatroom_path
        else
            flash.now[:alert] = "There was something wrong with your login details"
            render 'new'
        end   
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

    private

    def logged_in_redirect

        if  logged_in?
            redirect_to chatroom_path
        end
    end

end
