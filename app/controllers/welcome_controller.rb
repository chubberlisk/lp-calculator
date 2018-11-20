class WelcomeController < ApplicationController
  before_action :sign_out_admin_user!

  def index
  end
end
