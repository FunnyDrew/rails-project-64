# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers 

  setup do
    @user = users(:one)
    @post = posts(:post_without_comment)
    @attrs = {
      content: Faker::Lorem.paragraph(sentence_count: 2),
      category: categories(:one)
    }
    sign_in @user
  end
  
  test 'create comment by registred user' do
    assert_difference("@post.comments.count", 1) do
      #debugger
      post post_comments_url  @post, params: {post_comment: @attrs}
    end
    #assert{true}
  end

  test 'create subcomment' do
    
  end

end
