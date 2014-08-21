class GemInstancesController < ApplicationController
  def show
    gem_instance = GemInstance.find(params[:id])
    @gem_info = Gems.info(gem_instance.name)
  end
end