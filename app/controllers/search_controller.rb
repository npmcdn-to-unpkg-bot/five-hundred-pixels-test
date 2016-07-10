class SearchController < ApplicationController

  before_action :setup_search_term_service

  def index
    @search_form = SearchForm.new
    @api_results = five_hundred_pixels_service.popular_photos
  end

  def create
    @search_form = SearchForm.new(search_params)
    if @search_form.save
      redirect_to results_search_index_path(@search_form.search_term_key)
    else
      render :index
    end
  end

  def results
    @api_results = five_hundred_pixels_service.search(@search_term_service.key_to_search_term, params.fetch('page', 1))
    @more_results_path = determine_more_results_path
    @search_form = SearchForm.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def click
    @click = Click.find_or_create_click_record(params.fetch('search_term'), params.fetch('external_id'))
    @click.increment!(:click_count)
    redirect_to "https://marketplace.500px.com/photos/#{params.fetch('external_id')}"
  end

  private

  def search_params
    params.require(:search_form).permit(:search_term)
  end

  def setup_search_term_service
    @search_term_service ||= SearchTermService.new(params[:search_term])
  end

  def determine_more_results_path
    more_results_search_index_path(@search_term_service.key_to_search_term,
                                   @api_results.fetch('current_page').to_i + 1)
  end

end
