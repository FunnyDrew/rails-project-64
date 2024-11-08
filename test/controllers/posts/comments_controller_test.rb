# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @attrs = {
      content: Faker::Lorem.paragraph(sentence_count: 2)
    }
    sign_in @user
  end

  test 'create comment' do
    @post = posts(:post_without_comment)
    assert_difference("@post.comments.count", 1) do
      post post_comments_url  @post, params: {post_comment: @attrs}
    end
    assert{@post.comments.first.ancestry == '/'}
  end

  test 'create subcomment' do
    @post = posts(:two)
    @comment = post_comments(:deep_nested)

    assert_difference("@post.comments.count", 1) do
      post post_comments_url @post, params: {post_comment: @attrs.merge(parent_id: @comment.id)}
    end
    triple_nested_comment = PostComment.find_by @attrs

    assert{triple_nested_comment}
    first = triple_nested_comment.ancestry
    second = [@comment.ancestry, @comment.id,'/'].join
    assert {first == second}
  end

end
