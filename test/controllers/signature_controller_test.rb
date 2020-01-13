require 'test_helper'

class SignatureControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get signature_home_url
    assert_response :success
  end

  test "should get index" do
    get signature_index_url
    assert_response :success
  end

  test "should get invoice" do
    get signature_invoice_url
    assert_response :success
  end

end
