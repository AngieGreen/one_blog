require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | 52 Apps Project by Angie Green"
  end

  test "should get the rules" do
    get :rules
    assert_response :success
    assert_select "title", "The Rules | 52 Apps Project by Angie Green"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | 52 Apps Project by Angie Green"
  end

    test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | 52 Apps Project by Angie Green"
  end

end