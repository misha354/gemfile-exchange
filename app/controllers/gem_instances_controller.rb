class GemInstancesController < ApplicationController
  def index
    @gem_instances = GemInstance.all.sort_by {|x| x.num_uses}.reverse
  end

  def show
    @gem_instance = GemInstance.find(params[:id])
    @gem_info = Gems.info(@gem_instance.name)
    @gemfiles = @gem_instance.gemfiles.sort_by {|x| x.total_votes}.reverse
  end
end