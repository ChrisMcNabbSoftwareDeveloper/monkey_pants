require 'spec_helper'
require 'savon'
require 'pry'

describe Api::GasPricesController do

  it 'can get gas prices for a postal code' do
    client = Savon.client do
      pretty_print_xml true
      wsdl "http://127.0.0.1:3008/api/gas_prices/wsdl"
    end

    response = call_and_fail_gracefully(client, :get_gas_prices) do
      message(:postal_code => 12345)
    end
    Rails.logger.debug "/" * 80
    Rails.logger.debug " OUTPUT Back to AVAYA SOAP RESPONSE"
    Rails.logger.debug "/" * 80
    Rails.logger.debug response
    Rails.logger.debug "/" * 80
    Rails.logger.debug response.body
    Rails.logger.flush
    group_id = response.body[:get_gas_prices_response][:value]
  end
end

