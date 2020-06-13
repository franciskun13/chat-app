class ChatroomController < ApplicationController

    before_action :require_user
   
    def index
        @messages = Message.all
    end

    private

    def set_message
        @message = Message.find(params[:id])
    end

end
