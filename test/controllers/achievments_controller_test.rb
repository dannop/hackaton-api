require 'test_helper'

class AchievmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @achievment = achievments(:one)
  end

  test "should get index" do
    get achievments_url, as: :json
    assert_response :success
  end

  test "should create achievment" do
    assert_difference('Achievment.count') do
      post achievments_url, params: { achievment: { description: @achievment.description, image: @achievment.image, name: @achievment.name } }, as: :json
    end

    assert_response 201
  end

  test "should show achievment" do
    get achievment_url(@achievment), as: :json
    assert_response :success
  end

  test "should update achievment" do
    patch achievment_url(@achievment), params: { achievment: { description: @achievment.description, image: @achievment.image, name: @achievment.name } }, as: :json
    assert_response 200
  end

  test "should destroy achievment" do
    assert_difference('Achievment.count', -1) do
      delete achievment_url(@achievment), as: :json
    end

    assert_response 204
  end
end
