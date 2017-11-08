require 'test_helper'

class MovieMethodsControllerTest < ActionDispatch::IntegrationTest

    setup do
        @movie = movies(:one)
        @review1 = reviews(:one)
        @review2 = reviews(:top5_one)
        @review3 = reviews(:top5_two)
        @review4 = reviews(:top5_three)
        @review5 = reviews(:top5_four)
        @negative_review = reviews(:top5_five)

        @NUM_OF_REVIEWS = 6
    end

    test "should show movie" do
        get '/movie_top_reviews/' + String(@movie.id), as: :json, headers: authenticated_header
        assert_response :success
    end

    test "should show top five" do
        get '/movie_top_reviews/' + String(@movie.id), as: :json, headers: authenticated_header
        assert_response :success
        assert_equal @review1.rating, json_response[0]["rating"]
        assert_equal @review2.rating, json_response[1]["rating"]
        assert_equal @review3.rating, json_response[2]["rating"]
        assert_equal @review4.rating, json_response[3]["rating"]
        assert_equal @review5.rating, json_response[4]["rating"]
    end

    test "should show all reviews" do
        get '/movie_reviews/' + String(@movie.id), as: :json, headers: authenticated_header
        assert_response :success

        assert_equal @NUM_OF_REVIEWS, json_response.length
        assert_equal @review1.rating, json_response[0]["rating"]
        assert_equal @review2.rating, json_response[1]["rating"]
        assert_equal @review3.rating, json_response[2]["rating"]
        assert_equal @review4.rating, json_response[3]["rating"]
        assert_equal @review5.rating, json_response[4]["rating"]
        assert_equal @negative_review.rating, json_response[5]["rating"]
    end

end