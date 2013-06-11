require 'test_helper'

class ScoreboardsControllerTest < ActionController::TestCase
  setup do
    @scoreboard = scoreboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scoreboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scoreboard" do
    assert_difference('Scoreboard.count') do
      post :create, scoreboard: { comments: @scoreboard.comments, fixture_id: @scoreboard.fixture_id, matchscore: @scoreboard.matchscore, user_id: @scoreboard.user_id }
    end

    assert_redirected_to scoreboard_path(assigns(:scoreboard))
  end

  test "should show scoreboard" do
    get :show, id: @scoreboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scoreboard
    assert_response :success
  end

  test "should update scoreboard" do
    put :update, id: @scoreboard, scoreboard: { comments: @scoreboard.comments, fixture_id: @scoreboard.fixture_id, matchscore: @scoreboard.matchscore, user_id: @scoreboard.user_id }
    assert_redirected_to scoreboard_path(assigns(:scoreboard))
  end

  test "should destroy scoreboard" do
    assert_difference('Scoreboard.count', -1) do
      delete :destroy, id: @scoreboard
    end

    assert_redirected_to scoreboards_path
  end
end
