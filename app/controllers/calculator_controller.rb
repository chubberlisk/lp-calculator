class CalculatorController < ApplicationController
  before_action :sign_out_admin_user!
  before_action :set_user, except: :index

  def index
  end

  def add_player_two
    @player_two = User.find_by(email: player_two_params[:player_two][:email])
    respond_to do |format|
      if @player_two && @player_two.valid_password?(player_two_params[:player_two][:password]) && !@player_two.eql?(@user)
        @duel = Duel.new(
          player_one_id: @user.id, 
          player_two_id: @player_two.id,
          starting_lp: player_two_params[:starting_lp]
        )
        @error = "Sorry, an error has occurred! Unable to create duel session." if !@duel.save
        format.js
      else
        @error = "Sorry! Invalid email or password."
        format.js
      end
    end
  end
    
  private

  def set_user
    @user = User.find(player_two_params[:user_id])
  end

  def player_two_params 
    params.permit(:starting_lp, :user_id, player_two: [:email, :password])
  end
end
