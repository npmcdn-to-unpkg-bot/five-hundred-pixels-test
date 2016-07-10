class FiveHundredPixelsService
  include HTTParty

  def initialize(search_term="", page=1)
    @base_uri = 'https://api.500px.com'
    @options = {
      query: {
        consumer_key: ENV['FIVE_HUNDRED_PIXELS_CONSUMER_KEY'],
        image_size: 30
      }
    }
  end

  def popular_photos
    HTTParty.get("#{@base_uri}/v1/photos", merge_popular_parameters)
  end

  def search(search_term, page)
    @search_term = search_term
    @page = page
    HTTParty.get("#{@base_uri}/v1/photos/search", merge_search_parameters)
  end

  private

  def merge_popular_parameters
    @options[:query][:feature] = 'latest_today'
    @options
  end

  def merge_search_parameters
    @options[:query][:term] = @search_term
    @options[:query][:page] = @page
    @options
  end

end

# five_hundred_pixels_service = FiveHundredPixelsService.new("", 1)
# puts five_hundred_pixels_service.photos

