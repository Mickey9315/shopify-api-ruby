# typed: strict
# frozen_string_literal: true

$VERBOSE = nil
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "minitest/autorun"
require "webmock/minitest"

require "shopify_api"
require_relative "../../test_helper"

class PaymentGateway202104Test < Test::Unit::TestCase
  def setup
    super

    @test_session = ShopifyAPI::Auth::Session.new(id: "id", shop: "this-is-a-test-shop.myshopify.io", access_token: "this_is_a_test_token")
    modify_context(api_version: "2021-04")
  end

  sig do
    void
  end
  def test_1()
    stub_request(:get, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways.json")
      .with(
        headers: {"Accept"=>"application/json", "X-Shopify-Access-Token"=>"this_is_a_test_token"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::PaymentGateway.all(
      session: @test_session,
    )

    assert_requested(:get, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways.json")
  end

  sig do
    void
  end
  def test_2()
    stub_request(:get, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways.json?disabled=false")
      .with(
        headers: {"Accept"=>"application/json", "X-Shopify-Access-Token"=>"this_is_a_test_token"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::PaymentGateway.all(
      session: @test_session,
      disabled: "false",
    )

    assert_requested(:get, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways.json?disabled=false")
  end

  sig do
    void
  end
  def test_3()
    stub_request(:post, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways.json")
      .with(
        headers: {"Accept"=>"application/json", "X-Shopify-Access-Token"=>"this_is_a_test_token", "Content-Type"=>"application/json"},
        body: { "payment_gateway" => hash_including({credential1: "someone@example.com", provider_id: 7}) }
      )
      .to_return(status: 200, body: "{}", headers: {})

    payment_gateway = ShopifyAPI::PaymentGateway.new(session: @test_session)
    payment_gateway.credential1 = "someone@example.com"
    payment_gateway.provider_id = 7
    payment_gateway.save()

    assert_requested(:post, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways.json")
  end

  sig do
    void
  end
  def test_4()
    stub_request(:get, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways/431363653.json")
      .with(
        headers: {"Accept"=>"application/json", "X-Shopify-Access-Token"=>"this_is_a_test_token"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::PaymentGateway.find(
      session: @test_session,
      id: "431363653",
    )

    assert_requested(:get, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways/431363653.json")
  end

  sig do
    void
  end
  def test_5()
    stub_request(:put, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways/170508070.json")
      .with(
        headers: {"Accept"=>"application/json", "X-Shopify-Access-Token"=>"this_is_a_test_token", "Content-Type"=>"application/json"},
        body: { "payment_gateway" => hash_including({id: 170508070, sandbox: true}) }
      )
      .to_return(status: 200, body: "{}", headers: {})

    payment_gateway = ShopifyAPI::PaymentGateway.new(session: @test_session)
    payment_gateway.id = 170508070
    payment_gateway.sandbox = true
    payment_gateway.save()

    assert_requested(:put, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways/170508070.json")
  end

  sig do
    void
  end
  def test_6()
    stub_request(:delete, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways/170508070.json")
      .with(
        headers: {"Accept"=>"application/json", "X-Shopify-Access-Token"=>"this_is_a_test_token"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::PaymentGateway.delete(
      session: @test_session,
      id: "170508070",
    )

    assert_requested(:delete, "https://this-is-a-test-shop.myshopify.io/admin/api/2021-04/payment_gateways/170508070.json")
  end

end
