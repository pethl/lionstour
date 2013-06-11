require 'test_helper'

class SquadPerformancesControllerTest < ActionController::TestCase
  setup do
    @squad_performance = squad_performances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:squad_performances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create squad_performance" do
    assert_difference('SquadPerformance.count') do
      post :create, squad_performance: { dropgoals: @squad_performance.dropgoals, fixture_id: @squad_performance.fixture_id, play: @squad_performance.play, squad_id: @squad_performance.squad_id, total: @squad_performance.total, tries: @squad_performance.tries }
    end

    assert_redirected_to squad_performance_path(assigns(:squad_performance))
  end

  test "should show squad_performance" do
    get :show, id: @squad_performance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @squad_performance
    assert_response :success
  end

  test "should update squad_performance" do
    put :update, id: @squad_performance, squad_performance: { dropgoals: @squad_performance.dropgoals, fixture_id: @squad_performance.fixture_id, play: @squad_performance.play, squad_id: @squad_performance.squad_id, total: @squad_performance.total, tries: @squad_performance.tries }
    assert_redirected_to squad_performance_path(assigns(:squad_performance))
  end

  test "should destroy squad_performance" do
    assert_difference('SquadPerformance.count', -1) do
      delete :destroy, id: @squad_performance
    end

    assert_redirected_to squad_performances_path
  end
end
