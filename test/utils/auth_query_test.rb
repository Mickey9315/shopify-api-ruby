# typed: true
# frozen_string_literal: true

require_relative "./verifiable_query_test_helper"

class AuthQueryTest < Minitest::Test
  include VerifiableQueryTestHelper
  def setup
    @subject = ShopifyAPI::Utils::AuthQuery.new(
      code: "somecode",
      shop: "some-shop.myshopify.com",
      state: "1234",
      timestamp: "123456",
      host: "host",
      hmac: "hmac"
    )
  end
end
