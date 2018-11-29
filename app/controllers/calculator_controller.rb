class CalculatorController < ApplicationController
  before_action :sign_out_admin_user!
  before_action :set_user, only: :add_player_two
  skip_before_action :verify_authenticity_token if Rails.env.development?

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
        @error = 'Sorry, an error has occurred! Unable to create duel session.' if !@duel.save
        format.js
      else
        @error = 'Sorry! Invalid email or password.'
        format.js
      end
    end
  end

  def update_duel
    @duel = Duel.find(params[:id])
    @duel.ended_at = Time.now
    @duel.status = Duel.statuses[:completed]
    if @duel.update(duel_params)
      render json: { msg: 'Success! Duel has been saved.', status: :success }.to_json
    else
      render json: { error: 'Sorry, duel couldn\'t be saved!', status: :internal_server_error }.to_json
    end
  end

  private

  def set_user
    @user = User.find(player_two_params[:user_id])
  end

  def player_two_params 
    params.permit(:starting_lp, :user_id, player_two: [:email, :password])
  end

  def duel_params
    params.require(:duel).permit(:player_one_lp, :player_two_lp)
  end
end
