require 'test_helper'

class MymoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mymovie = mymovies(:one)
  end

  test "should get index" do
    get mymovies_url
    assert_response :success
  end

  test "should get new" do
    get new_mymovie_url
    assert_response :success
  end

  test "should create mymovie" do
    assert_difference('Mymovie.count') do
      post mymovies_url, params: { mymovie: { impression: @mymovie.impression, last_episode: @mymovie.last_episode, movie_id: @mymovie.movie_id, ranking: @mymovie.ranking, status: @mymovie.status, times_watched: @mymovie.times_watched, urgent: @mymovie.urgent, user_id: @mymovie.user_id, watching_end: @mymovie.watching_end, watching_season: @mymovie.watching_season, watching_start: @mymovie.watching_start } }
    end

    assert_redirected_to mymovie_url(Mymovie.last)
  end

  test "should show mymovie" do
    get mymovie_url(@mymovie)
    assert_response :success
  end

  test "should get edit" do
    get edit_mymovie_url(@mymovie)
    assert_response :success
  end

  test "should update mymovie" do
    patch mymovie_url(@mymovie), params: { mymovie: { impression: @mymovie.impression, last_episode: @mymovie.last_episode, movie_id: @mymovie.movie_id, ranking: @mymovie.ranking, status: @mymovie.status, times_watched: @mymovie.times_watched, urgent: @mymovie.urgent, user_id: @mymovie.user_id, watching_end: @mymovie.watching_end, watching_season: @mymovie.watching_season, watching_start: @mymovie.watching_start } }
    assert_redirected_to mymovie_url(@mymovie)
  end

  test "should destroy mymovie" do
    assert_difference('Mymovie.count', -1) do
      delete mymovie_url(@mymovie)
    end

    assert_redirected_to mymovies_url
  end
end
