require 'test_helper'

class MakeRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get make_recipes_index_url
    assert_response :success
  end

  test "should get new" do
    get make_recipes_new_url
    assert_response :success
  end

end
