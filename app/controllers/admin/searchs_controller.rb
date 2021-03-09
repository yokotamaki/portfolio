class Admin::SearchsController < ApplicationController
  def search
    @keyword = search_params[:keyword]
    @model = search_params[:model]
    if @model == "reservation"
      @reservation = Reservation.search(@keyword)
    elsif @model == "contact"
      @contact = Contact.search(@keyword)
    end
  end

  private
    def search_params
    params.fetch(:search, {}).permit(:keyword, :model)
  end

end
