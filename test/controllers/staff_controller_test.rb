require 'test_helper'

class StaffControllerTest < ActionController::TestCase
  test "should get eric" do
    get :eric
    assert_response :success
  end

end
