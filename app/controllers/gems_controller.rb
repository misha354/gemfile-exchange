class GemsController < ApplicationController
  def show
    @gem = Gems.info(params[:id])
  end
end