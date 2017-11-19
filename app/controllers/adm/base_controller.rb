class Adm::BaseController < ApplicationController
  layout 'adm/application'

  if ENV['BASIC_AUTH_USERNAME'].present? && ENV['BASIC_AUTH_PASSWORD'].present?
    http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']
  end
end
