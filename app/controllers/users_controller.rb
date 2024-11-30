# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    unless current_user.id == @user.id
      redirect_to posts_url, notice: t('.access_error')
      return
    end
    @user
  end
end
