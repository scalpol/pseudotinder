class UsersController < ApplicationController
  before_action :authenticate_user!

  def search
    @user = User.order("RANDOM()").first
    known = false
    interactions = current_user.interactions
    if interactions.count == User.count - 1
      redirect_to no_more_path
      return
    end
    interactions.each do |interaction|
      if interaction.choosed == @user.id
        known = true
        break
      end
    end
    redirect_to search_path if known == true
  end

  def match
  end

  def matches
    @matches = []
    current_user.matches_one.each do |match|
      if match.user_one_id == current_user.id
        @matches << User.find(match.user_two_id)
      else
        @matches << User.find(match.user_one_id)
      end
    end
    current_user.matches_two.each do |match|
      if match.user_one_id == current_user.id
        @matches << User.find(match.user_two_id)
      else
        @matches << User.find(match.user_one_id)
      end
    end
  end

  # deberia haber seguido convencion REST (create x los 2)
  def like
    choosed = User.find(params[:choosed])
    Interaction.create(user_id: current_user.id, choosed: choosed.id, like: true)
    choosed.interactions.each do |interaction|
       if interaction.choosed == current_user.id
         Match.create(user_one_id: current_user.id, user_two_id: choosed.id)
         redirect_to match_path
         return
       end
    end
    redirect_to search_path
  end

  def not_like
    choosed = User.find(params[:choosed])
    Interaction.create(user_id: current_user.id, choosed: choosed.id, like: false)
    redirect_to search_path
  end

  def no_more
  end
end
