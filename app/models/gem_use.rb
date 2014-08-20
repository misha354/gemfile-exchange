class GemUse < ActiveRecord::Base
  belongs_to :gemfile
  belongs_to :versioned_gem
end
