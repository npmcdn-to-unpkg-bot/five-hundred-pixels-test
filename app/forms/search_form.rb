class SearchForm
  include ActiveModel::Model

  attr_accessor :search_term
  attr_accessor :search_term_key

  validates :search_term, presence: true

  def save
    if valid?
      self.search_term_key = search_term_service.search_term_to_key
    end
  end

  def search_term_service
    SearchTermService.new(search_term)
  end

end
