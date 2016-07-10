class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :setup_logger

  def setup_logger
    @logger = Logger.new('log/debug.log')
  end

  def five_hundred_pixels_service
    @five_hundred_pixels_service ||= FiveHundredPixelsService.new
  end

end
