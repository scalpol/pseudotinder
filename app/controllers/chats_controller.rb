class ChatsController < ApplicationController

  def show
    messages = Chat.where(user_id: [current_user, params[:user_id]])
    if messages.nil?
      @messages = ['No hay mensajes aún', 'Toma la iniciativa y escribe un mensaje!']
    else
      messages.sort_by(&:created_at)
      @messages = messages.map { |msg| [User.find(msg).name, msg.message] }
    end
    @match = params[:match_id]
    @chat = Chat.new
  end

  def create
  end

end
