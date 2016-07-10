require 'rails_helper'

describe SearchTermService do

  describe '#search_term_to_key' do
    it 'converts search term to key slug' do
      search_term_key = SearchTermService.new('new business').search_term_to_key
      expect(search_term_key).to eq('new-business')
    end
  end

  describe '#key_to_search_term' do
    it 'converts key slug to search term' do
      search_term = SearchTermService.new('new-business').key_to_search_term
      expect(search_term).to eq('new business')
    end
  end

end
