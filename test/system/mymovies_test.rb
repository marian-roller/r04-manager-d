require "application_system_test_case"

class MymoviesTest < ApplicationSystemTestCase
  setup do
    @mymovie = mymovies(:one)
  end

  test "visiting the index" do
    visit mymovies_url
    assert_selector "h1", text: "Mymovies"
  end

  test "creating a Mymovie" do
    visit mymovies_url
    click_on "New Mymovie"

    fill_in "Impression", with: @mymovie.impression
    fill_in "Last episode", with: @mymovie.last_episode
    fill_in "Movie", with: @mymovie.movie_id
    fill_in "Ranking", with: @mymovie.ranking
    fill_in "Status", with: @mymovie.status
    fill_in "Times watched", with: @mymovie.times_watched
    check "Urgent" if @mymovie.urgent
    fill_in "User", with: @mymovie.user_id
    fill_in "Watching end", with: @mymovie.watching_end
    fill_in "Watching season", with: @mymovie.watching_season
    fill_in "Watching start", with: @mymovie.watching_start
    click_on "Create Mymovie"

    assert_text "Mymovie was successfully created"
    click_on "Back"
  end

  test "updating a Mymovie" do
    visit mymovies_url
    click_on "Edit", match: :first

    fill_in "Impression", with: @mymovie.impression
    fill_in "Last episode", with: @mymovie.last_episode
    fill_in "Movie", with: @mymovie.movie_id
    fill_in "Ranking", with: @mymovie.ranking
    fill_in "Status", with: @mymovie.status
    fill_in "Times watched", with: @mymovie.times_watched
    check "Urgent" if @mymovie.urgent
    fill_in "User", with: @mymovie.user_id
    fill_in "Watching end", with: @mymovie.watching_end
    fill_in "Watching season", with: @mymovie.watching_season
    fill_in "Watching start", with: @mymovie.watching_start
    click_on "Update Mymovie"

    assert_text "Mymovie was successfully updated"
    click_on "Back"
  end

  test "destroying a Mymovie" do
    visit mymovies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mymovie was successfully destroyed"
  end
end
