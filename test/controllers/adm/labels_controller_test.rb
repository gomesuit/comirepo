require 'test_helper'

class Adm::LabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adm_label = adm_labels(:one)
  end

  test "should get index" do
    get adm_labels_url
    assert_response :success
  end

  test "should get new" do
    get new_adm_label_url
    assert_response :success
  end

  test "should create adm_label" do
    assert_difference('Adm::Label.count') do
      post adm_labels_url, params: { adm_label: {  } }
    end

    assert_redirected_to adm_label_url(Adm::Label.last)
  end

  test "should show adm_label" do
    get adm_label_url(@adm_label)
    assert_response :success
  end

  test "should get edit" do
    get edit_adm_label_url(@adm_label)
    assert_response :success
  end

  test "should update adm_label" do
    patch adm_label_url(@adm_label), params: { adm_label: {  } }
    assert_redirected_to adm_label_url(@adm_label)
  end

  test "should destroy adm_label" do
    assert_difference('Adm::Label.count', -1) do
      delete adm_label_url(@adm_label)
    end

    assert_redirected_to adm_labels_url
  end
end
