class Gemfile < ActiveRecord::Base
  has_many :gem_uses

  validates :source, presence: true

  before_save :extract_gem_uses

  private

  def extract_gem_uses
    included_gems = extract_gem_names_and_versions
    included_gems.each do |included_gem|
        versioned_gem = VersionedGem.where(gem_name: included_gem[0],
                                         gem_version: included_gem[1]).first_or_create
        GemUse.create(versioned_gem: versioned_gem, gemfile_id: self.id)
    end
  end
  
  def extract_gem_names_and_versions
    self.source.scan(/gem\s*'(\w*)'(?:,\s*('.*'))?/)
  end
end