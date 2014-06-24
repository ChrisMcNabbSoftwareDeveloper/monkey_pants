require 'spec_helper'
require 'savon'
require 'pry'

describe Api::GasPricesController do
  HTTPI.adapter = :rack
  HTTPI::Adapter::Rack.mount 'application', MonkeyPants::Application

  it 'can get gas prices for a postal code' do
    client = Savon.client do
      application_base = "http://application"
      wsdl "http://application/api/gas_prices/wsdl"
    end

    response = call_and_fail_gracefully(client, :get_gas_prices) do
      message(:postal_code => 12345)
    end

    puts response.body
    group_id = response.body[:get_gas_prices_response][:value]
    #  fahrenheit = response.body[:convert_temp_response][:convert_temp_result]
    #  expect(fahrenheit).to eq("86")
    #result = client.call(:get_gas_prices, :message => { :postal_code => 54703 })
    #result.body[:get_gas_prices_response][:value].should_not be_nil
  end
end

