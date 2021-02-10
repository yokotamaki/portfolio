class RoomsController < ApplicationController
  def index
    # @rooms = Room.all
    @room1 = Room.find(1)
    @room2 = Room.find(2)
    @room3 = Room.find(3)
  end
end
