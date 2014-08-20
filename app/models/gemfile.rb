class Gemfile < ActiveRecord::Base
  has_many :gem_uses

  validate :extract_gem_uses

  private

  def extract_gem_uses
    included_gems = extract_gem_names_and_versions
    included_gems.each do |included_gem|
      gem_instance = GemInstance.find_by(name: included[0]) 
        
      if !gem_instance
        gem_instance = GemInstance.new(name: included[0])
        if !gem_instance.save
          return false
        end
      end  

      GemUse.create(gem_instance: gem_instance, version: included[1])
    end
    return true
  end

  def extract_gem_names_and_versions
    self.source.scan(/gem\s*'(\w*)'(?:,\s*('.*'))?/)
  end
end