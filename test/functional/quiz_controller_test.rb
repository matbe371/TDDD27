require 'test_helper'

class QuizControllerTest < ActionController::TestCase
  test "should get play" do
    get :play
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
