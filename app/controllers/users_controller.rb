class UsersController < ApplicationController

    before_action :logged_in_redirect, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            session[:username] = @user.username
            flash[:notice] = "Welcome to Realtime Chat App #{@user.username}, you have successfully signed up"
            redirect_to chatroom_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def logged_in_redirect

        if  logged_in?
            redirect_to chatroom_path
        end
    end

end