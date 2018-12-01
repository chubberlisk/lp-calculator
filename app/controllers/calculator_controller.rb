class CalculatorController < ApplicationController
  before_action :sign_out_admin_user!
  skip_before_action :verify_authenticity_token if Rails.env.development?

  def index
  end

  def add_player_two
    return render file: 'public/400.html', status: :bad_request unless player_two_params?

    respond_to do |format|
      @user = User.find_by(id: player_two_params[:user_id])
      @player_two = User.find_by(email: player_two_params[:player_two][:email])
      if @user && @player_two && @player_two.valid_password?(player_two_params[:player_two][:password]) && !@player_two.eql?(@user)
        @duel = Duel.new(
          player_one: @user,
          player_two: @player_two,
          starting_lp: player_two_params[:starting_lp].to_i
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
    return render file: 'public/400.html', status: :bad_request unless duel_params?

    @duel = Duel.find_by(id: params[:id].to_i)
    @duel.ended_at = Time.now
    @duel.status = Duel.statuses[:completed]
    if @duel.update(duel_params)
      render json: { msg: 'Success! Duel has been saved.', status: :success }.to_json
    else
      render json: { error: 'Sorry, duel couldn\'t be saved!', status: :internal_server_error }.to_json
    end
  end

  private

  def player_two_params
    params.permit(:starting_lp, :user_id, player_two: [:email, :password])
  end

  def player_two_params?
    params.key?(:starting_lp) && params.key?(:user_id) && params.key?(:player_two)
  end

  def duel_params
    params.require(:duel).permit(:player_one_lp, :player_two_lp)
  end

  def duel_params?
    params.key?(:id) && params.key?(:duel)
  end
end
