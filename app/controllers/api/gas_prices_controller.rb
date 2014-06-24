require 'pry'

class Api::GasPricesController < ApplicationController
  include WashOut::SOAP
  soap_service namespace: 'urn:WashOut', snakecase_input: true

  soap_action "GetGasPrices",
    :args   => {:postal_code => :string },
    :return => :string
  def GetGasPrices
    Rails.logger.debug "*" * 80
    Rails.logger.debug " SOAP REQUEST Sent from fake Avaya (using Rspec) "
    Rails.logger.debug "*" * 80
    Rails.logger.debug request.raw_post
    Rails.logger.debug "*" * 80
    render :soap => GasPrices.find_all_by_postal_code(params[:postal_code]).first.id
  end

end
