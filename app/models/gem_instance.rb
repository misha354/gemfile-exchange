class GemInstance < ActiveRecord::Base
  has_many :gem_uses

  def num_gem_uses
    GemUse.where(gem_instance: self).count
  end

  def most_popular_version
    versions = GemUse.where(gem_instance: self).group(:version).count
    return versions.max_by{|k, v| v}[0]
  end

end

