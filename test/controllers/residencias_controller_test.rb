require 'test_helper'

class ResidenciasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get residencias_index_url
    assert_response :success
  end

end
