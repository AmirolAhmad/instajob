require 'test_helper'

sign_in :user, @user   # sign_in(scope, resource)
sign_in @user          # sign_in(resource)

sign_out :user         # sign_out(scope)
sign_out @user         # sign_out(resource)

class UserControllerTest < ActionController::TestCase
  test "should get show" do
  	get :show
  	assert_response :success
  end

  test "should get edit" do
  	get :edit
  	assert_response :success
  end

end
