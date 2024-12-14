# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test 'show statistic page to owner' do
    @user = users(:one)
    sign_in @user
    get user_path(@user.id)
    assert_response(:success)
  end

  test 'redirect if statistic page try open not owner' do
    @user_watcher = users(:one)
    @user_owner = users(:two)
    sign_in @user_watcher
    get user_path(@user_owner.id)
    assert_response(:redirect)
  end
end
