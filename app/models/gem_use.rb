class GemUse < ActiveRecord::Base
  belongs_to :gemfile
  belongs_to :gem_instance
end
