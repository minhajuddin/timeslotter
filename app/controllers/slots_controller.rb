class SlotsController < ApplicationController
  def index
    @slots = Slot.all

    respond_to do |format|
      format.html
      format.json { render :json => @slots.to_json }
    end
  end

  def show
    @slot = Slot.find(params[:id])
    render :json => @slot.to_json
  end

  def create
    @slot = Slot.create!(:title => params[:title])
    render :json => {:status => 'success'}
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
