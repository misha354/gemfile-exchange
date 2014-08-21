class GemInstance < ActiveRecord::Base
  has_many :gem_uses

  def num_gem_uses
    GemUse.where(gem_instance: self).count
  end
end

