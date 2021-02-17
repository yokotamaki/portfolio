class Admin::SearchsController < ApplicationController
  def search
    @keyword = params[:keyword]
    @model = params[:model]
    if @model == "reservation"
      @reservation = Reservation.search(@keyword)
    elsif @model == "contact"
      @contact = Contact.search(@keyword)
    end
  end
end
