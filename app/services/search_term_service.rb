class SearchTermService

  attr_reader :search_term_to_key
  attr_reader :key_to_search_term

  def initialize(subject)
    @subject = subject
  end

  def search_term_to_key
    @subject ? @subject.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') : '-'
  end

  def key_to_search_term
    @subject ? @subject.gsub(/-/, ' ') : '-'
  end

end
