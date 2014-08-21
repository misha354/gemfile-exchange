class GemInstancesController < ApplicationController
  def index
    @gem_instances = GemInstance.all.sort_by{|x| x.num_gem_uses}.reverse
  end

  def show
    gem_instance = GemInstance.find(params[:id])
    @gem_info = Gems.info(gem_instance.name)
  end
end