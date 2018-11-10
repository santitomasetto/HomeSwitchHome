require 'test_helper'

class SubastasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subastas_index_url
    assert_response :success
  end

end
