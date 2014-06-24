require 'pry'

class Api::GasPricesController < ApplicationController
  include WashOut::SOAP

  soap_action "GetGasPrices",
    :args   => {:postal_code => :integer},
    :return => :string
  def GetGasPrices
    render :soap => GasPrices.find_all_by_postal_code(params[:postal_code]).to_xml.to_s
  end

  soap_action "GetGasServiceStations",
    :args   => {:postal_code => :integer},
    :return => :string
  def GetGasServiceStations
    render :soap => GasPrices.find_all_by_postal_code(params[:postal_code]).to_xml.to_s
  end

end
