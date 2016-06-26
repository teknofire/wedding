require 'test_helper'

class RsvpsControllerTest < ActionController::TestCase
  setup do
    @rsvp = rsvps(:one)
    session[:registration_code] = @rsvp.slug
  end

  test "should get new" do
    session[:registration_code] = nil

    get :new
    assert_response :success
  end

  test "should redirect to edit" do
    get :new
    assert_redirected_to edit_rsvp_path(@rsvp)
  end

  test "should create rsvp" do
    assert_difference('Rsvp.count') do
      post :create, rsvp: { additional_guest: @rsvp.additional_guest, code: @rsvp.code, coming: @rsvp.coming, email: @rsvp.email, message: @rsvp.message, name: @rsvp.name, overnight: @rsvp.overnight }
    end

    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  test "should show rsvp" do
    get :show, id: @rsvp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rsvp
    assert_response :success
  end

  test "should update rsvp" do
    patch :update, id: @rsvp, rsvp: { additional_guest: @rsvp.additional_guest, code: @rsvp.code, coming: @rsvp.coming, email: @rsvp.email, message: @rsvp.message, name: @rsvp.name, overnight: @rsvp.overnight }
    assert_redirected_to rsvp_path(assigns(:rsvp))
  end

  test "should destroy rsvp" do
    assert_difference('Rsvp.count', -1) do
      delete :destroy, id: @rsvp
    end

    assert_redirected_to root_path
  end
end
