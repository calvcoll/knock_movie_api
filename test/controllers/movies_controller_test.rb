require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url, as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post movies_url, params: { movie: { genre_id: @movie.genre_id, name: @movie.name, synopsis: @movie.synopsis } }, as: :json, headers: authenticated_header
    end

    assert_response 201
  end

  test "should show movie" do
    get movie_url(@movie), as: :json, headers: authenticated_header
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { genre_id: @movie.genre_id, name: @movie.name, synopsis: @movie.synopsis } }, as: :json, headers: authenticated_header
    assert_response 200
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete movie_url(@movie), as: :json, headers: authenticated_header
    end

    assert_response 204
  end
end
