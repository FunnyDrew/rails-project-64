# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find params[:id]
    unless current_user.id == @user.id
      redirect_to posts_url, notice: t('.access_error')
      return
    end
  end
end
