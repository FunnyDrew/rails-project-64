# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)
    @attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Movies::Ghostbusters.quote,
      creator: @user,
      category_id: @category.id
    }

  end

  test 'should get index' do
    get root_url
    assert_response :success    
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user
    post posts_url, params: { post: @attrs }

    post = Post.find_by @attrs
    assert { post }
    assert_redirected_to  post_url(post) 
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'creation post by unregistred user' do
    post posts_url, params: { post: @attrs }
    post = Post.find_by @attrs
    assert { !post }
    assert_redirected_to  post_url(post) 
  end
end
