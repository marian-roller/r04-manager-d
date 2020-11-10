require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
    @movie_with_mymovie = movies(:two)
    sign_in users(:two)
  end

  test "should get index" do
    sign_out users(:two)
    get movies_url
    assert_response :success
  end

  test "should get onlymovies" do
    sign_out users(:two)
    get onlymovies_url
    assert_response :success
  end

  test "should get onlytvseries" do
    sign_out users(:two)
    get onlytvseries_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_url
    assert_response :success
  end

  test "redirect get new" do
    sign_out users(:two)
    get new_movie_url
    assert_response :redirect
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { description: @movie.description, duration: @movie.duration, original_title: @movie.original_title, title: @movie.title, movie_type: @movie.movie_type, year_end: @movie.year_end, year_start: @movie.year_start } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "should not create movie" do
    assert_difference('Movie.count', 0) do
      post movies_url, params: { movie: { description: @movie.description, duration: @movie.duration, original_title: @movie.original_title, title: nil, movie_type: @movie.movie_type, year_end: @movie.year_end, year_start: @movie.year_start } }
    end

    assert_response :success
  end

  test "redirect create movie" do
    sign_out users(:two)
    assert_difference('Movie.count', 0) do
      post movies_url, params: { movie: { description: @movie.description, duration: @movie.duration, original_title: @movie.original_title, title: @movie.title, movie_type: @movie.movie_type, year_end: @movie.year_end, year_start: @movie.year_start } }
    end

    assert_redirected_to new_user_session_url
  end


  test "should show movie" do
    sign_out users(:two)
    get movie_url(@movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "redirect get edit" do
    sign_out users(:two)
    get edit_movie_url(@movie)
    assert_response :redirect
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, duration: @movie.duration, original_title: @movie.original_title, title: @movie.title, movie_type: @movie.movie_type, year_end: @movie.year_end, year_start: @movie.year_start } }
    assert_redirected_to movie_url(@movie)
  end

  test "should not update movie" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, duration: @movie.duration, original_title: @movie.original_title, title: nil, movie_type: @movie.movie_type, year_end: @movie.year_end, year_start: @movie.year_start } }
    assert_response :success
  end

  test "redirect update movie" do
    sign_out users(:two)
    patch movie_url(@movie), params: { movie: { description: @movie.description, duration: @movie.duration, original_title: @movie.original_title, title: @movie.title, movie_type: @movie.movie_type, year_end: @movie.year_end, year_start: @movie.year_start } }
    assert_redirected_to new_user_session_url
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie)
    end
    assert_redirected_to movies_url
  end

  test "should not destroy movie" do
    assert_difference('Movie.count', 0) do
      delete movie_url(@movie_with_mymovie)
    end
    assert_redirected_to movies_url
  end

  test "redirect destroy movie" do
    sign_out users(:two)
    assert_difference('Movie.count', 0) do
      delete movie_url(@movie)
    end

    assert_redirected_to new_user_session_url
  end

end
