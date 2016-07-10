require 'rails_helper'

describe FiveHundredPixelsService do

  let(:api_results) { { "current_page" => 1, "photos" => [{"id" => "123", "image_url" => "http://image.com"}] } }

  before(:each) do
    allow(HTTParty).to receive(:get).and_return(api_results)
  end

  describe '#popular_photos' do
    it 'returns api results' do
      results = FiveHundredPixelsService.new.popular_photos
      expect(results).to eq(api_results)
    end

  end

  describe '#search' do
    it 'returns api results' do
      results = FiveHundredPixelsService.new.search('business', page: 2)
      expect(results).to eq(api_results)
    end
  end

  describe '#merge_popular_parameters' do
    it 'updates options' do
      five_hundred_pixels_service = FiveHundredPixelsService.new
      options = five_hundred_pixels_service.send(:merge_popular_parameters)
      expect(options[:query]).to have_key(:feature)
    end
  end

  describe '#merge_search_parameters' do
    it 'updates options' do
      five_hundred_pixels_service = FiveHundredPixelsService.new('business')
      options = five_hundred_pixels_service.send(:merge_search_parameters)
      expect(options[:query]).to have_key(:term)
    end
  end
end
