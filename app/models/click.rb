class Click < ApplicationRecord

  def self.find_or_create_click_record(search_term, external_id)
    search_term ||= 'none'
    self.find_or_create_by({
      search_term: search_term,
      external_id: external_id
    })
  end

end
