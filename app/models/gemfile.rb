class Gemfile < ActiveRecord::Base
  has_many :gem_uses
  has_many :gem_instances, through: :gem_use
  has_many :votes

  validate :validate_source
  validates :name, presence: true

  after_save :extract_gem_uses
  
  GEM_NAME = 0
  GEM_VERSION = 1

  def extract_gem_uses
    included_gems = extract_gem_names_and_versions
    GemUse.where(gemfile: self).destroy_all

    included_gems.each do |included_gem|
      gem_instance = create_gem_instance(included_gem[GEM_NAME])
      create_gem_use(gem_instance, 
          included_gem[GEM_VERSION].nil? ? 'highest' : included_gem[GEM_VERSION])
    end
  end
       
  def create_gem_use(gem_instance, version)
    gem_use = GemUse.new(gemfile: self, gem_instance: gem_instance, version: version)
  
    if !gem_use.save
      raise ActiveRecord::RecordInvalid.new(self)  
      self.errors.add(:source, 'cannot be saved')
    end
  end

  def create_gem_instance(gem_name)
    gem_instance = GemInstance.find_by(name: gem_name) 
        
    if gem_instance.nil?
      gem_instance = GemInstance.new(name: gem_name)
    
      if !gem_instance.save
        raise ActiveRecord::RecordInvalid.new(self)  
        self.errors.add(:source, 'cannot be saved')
      end
    end

    return gem_instance
  end

  def extract_gem_names_and_versions
    self.source.gsub(/#.*$/,'').scan(gem_name_and_version_regex)
  end

  def gem_name_and_version_regex
    /gem\s*'(.*?)'(?:,\s*('.*'))?/
  end

  def validate_source
     if !(self.source =~ gem_name_and_version_regex)
      self.errors.add(:source, "does not contain any gems.")
    end
  end

  def up_votes
    Vote.where(gemfile: self).where(vote: true).count
  end

  def down_votes
    Vote.where(gemfile: self).where(vote: false).count
  end

  def total_votes 
    up_votes - down_votes
  end
end