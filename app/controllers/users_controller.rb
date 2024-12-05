# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find params[:id]
    (redirect_to posts_url, notice: t('.access_error')) if current_user.id != @user.id
  end
end
