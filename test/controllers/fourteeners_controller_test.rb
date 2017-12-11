require 'test_helper'

class FourteenersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fourteener = fourteeners(:one)
  end

  test "should get index" do
    get fourteeners_url
    assert_response :success
  end

  test "should get new" do
    get new_fourteener_url
    assert_response :success
  end

  test "should create fourteener" do
    assert_difference('Fourteener.count') do
      post fourteeners_url, params: { fourteener: { additional_info_url: @fourteener.additional_info_url, classification: @fourteener.classification, description: @fourteener.description, elevation_gain_in_feet: @fourteener.elevation_gain_in_feet, elevation_in_feet: @fourteener.elevation_in_feet, exposure: @fourteener.exposure, forest: @fourteener.forest, four_x_four_required: @fourteener.four_x_four_required, kml: @fourteener.kml, location_lat: @fourteener.location_lat, location_long: @fourteener.location_long, name: @fourteener.name, no_4wd_additional_distance_in_miles: @fourteener.no_4wd_additional_distance_in_miles, no_4wd_additional_elevation_in_feet: @fourteener.no_4wd_additional_elevation_in_feet, range: @fourteener.range, rank: @fourteener.rank, round_trip_distance_in_miles: @fourteener.round_trip_distance_in_miles, route_name: @fourteener.route_name, surname: @fourteener.surname, trailhead_lat: @fourteener.trailhead_lat, trailhead_long: @fourteener.trailhead_long, trailhead_name: @fourteener.trailhead_name } }
    end

    assert_redirected_to fourteener_url(Fourteener.last)
  end

  test "should show fourteener" do
    get fourteener_url(@fourteener)
    assert_response :success
  end

  test "should get edit" do
    get edit_fourteener_url(@fourteener)
    assert_response :success
  end

  test "should update fourteener" do
    patch fourteener_url(@fourteener), params: { fourteener: { additional_info_url: @fourteener.additional_info_url, classification: @fourteener.classification, description: @fourteener.description, elevation_gain_in_feet: @fourteener.elevation_gain_in_feet, elevation_in_feet: @fourteener.elevation_in_feet, exposure: @fourteener.exposure, forest: @fourteener.forest, four_x_four_required: @fourteener.four_x_four_required, kml: @fourteener.kml, location_lat: @fourteener.location_lat, location_long: @fourteener.location_long, name: @fourteener.name, no_4wd_additional_distance_in_miles: @fourteener.no_4wd_additional_distance_in_miles, no_4wd_additional_elevation_in_feet: @fourteener.no_4wd_additional_elevation_in_feet, range: @fourteener.range, rank: @fourteener.rank, round_trip_distance_in_miles: @fourteener.round_trip_distance_in_miles, route_name: @fourteener.route_name, surname: @fourteener.surname, trailhead_lat: @fourteener.trailhead_lat, trailhead_long: @fourteener.trailhead_long, trailhead_name: @fourteener.trailhead_name } }
    assert_redirected_to fourteener_url(@fourteener)
  end

  test "should destroy fourteener" do
    assert_difference('Fourteener.count', -1) do
      delete fourteener_url(@fourteener)
    end

    assert_redirected_to fourteeners_url
  end
end
