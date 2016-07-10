require 'rails_helper'

RSpec.describe Click, type: :model do

  describe '#find_or_create_click_record' do
    it 'should create a new record' do
      expect{
        Click.find_or_create_click_record('new business', '321')
      }.to change{ Click.count }.by(1)
    end
    it 'should find an existing record' do
      click = create(:click)
      result = Click.find_or_create_click_record('business', '123')
      expect(result).to eq(click)
    end
  end
end
