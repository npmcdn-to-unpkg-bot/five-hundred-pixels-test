require 'rails_helper'

describe SearchController, type: :controller do

  let(:api_results) { { "current_page" => 1, "photos" => [{"id" => "123", "image_url" => "http://image.com"}] } }

  before(:each) do
    allow(HTTParty).to receive(:get).and_return(api_results)
  end

  describe "GET #index" do

    subject { get :index }
    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end
    it 'assigns api_results' do
      subject
      expect(assigns(:api_results)).to eq(api_results)
    end

  end

  describe "POST #create" do

    describe 'valid search_term' do
      subject { post :create, params: { search_form: { search_term: 'business' } } }
      it "redirects to correct path" do
        expect(subject).to redirect_to results_search_index_path('business')
      end
    end

    describe 'invalid search_term' do
      subject { post :create, params: { search_form: { search_term: '' } } }
      it "redirects to correct path" do
        expect(subject).to render_template(:index)
      end
    end

  end

  describe "GET #results html" do
    subject { get :results, params: {search_term: 'business'} }
    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end
  end

  describe "GET #results xhr" do
    subject { get :results, xhr: true, params: {search_term: 'business'} }
    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end
  end

  describe 'GET #click' do
    subject { get :click, params: {search_term: 'business', external_id: '123'} }
    let(:click) { create(:click)  }

    it 'redirects to correct path' do
      expect(subject).to redirect_to "https://marketplace.500px.com/photos/123"
    end
    it 'creates new click record' do
      expect{subject}.to change{Click.count}.by(1)
    end

    it 'increments click record count' do
      click = create(:click, click_count: 0)
      subject
      click.reload
      expect(click.click_count).to eq(1)
    end
  end

end
