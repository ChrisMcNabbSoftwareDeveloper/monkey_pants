require 'spec_helper'
require 'savon'
require 'pry'

describe Api::GasPricesController do
  HTTPI.adapter = :rack
  HTTPI::Adapter::Rack.mount 'application', MonkeyPants::Application

  it 'can get gas prices for a postal code' do
    application_base = "http://application"
    client = Savon::Client.new(:wsdl => "http://application/api/gas_prices/wsdl")
#    client = Savon::Client.new({
#      :wsdl => application_base + api_gas_prices_wsdl_path,
#      # Lower timeouts so these specs don't take forever when the service is not available.
#      :open_timeout => 10,
#      :read_timeout => 10,
#      # Disable logging for cleaner spec output.
#      :log => false
#    })

#    begin
#      client.call(:get_quote)
#    rescue Savon::SOAPFault => e
#      $stderr.puts e.to_hash.inspect
#      f_c = e.to_hash[:fault][:faultstring]
#      expect(f_c).not_to  eq('No such operation \'getQuoteRequest\'')
#      expect(f_c).to eq('soapenv:Server.userException')
#      pending e
#    end
binding.pry
    result = client.call(:get_gas_prices, :message => { :postal_code => 54703 })
    result.body[:get_gas_prices_response][:value].should_not be_nil
  end
end

