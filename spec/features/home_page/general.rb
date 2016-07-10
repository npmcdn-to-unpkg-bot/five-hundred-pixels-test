require "rails_helper"

RSpec.feature "Home page loads", type: :feature do

  let(:api_results) { { "current_page" => 1, "photos" => [{"id" => "123", "image_url" => "http://image.com"}] } }

  before(:each) do
    allow(HTTParty).to receive(:get).and_return(api_results)
  end

  scenario "User visits the homepage" do
    visit "/"
    expect(page).to have_text("Enter your keywords below to see results from the 500px API")
  end
end
