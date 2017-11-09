class Usr::BaseController < ApplicationController
  before_action :detect_device_variant
  layout 'usr/application'

  private
    def detect_device_variant
      request.variant = :pc
      request.variant = :sp if request.user_agent&.match?(/iPhone|iPod|Android/)
    end
end
