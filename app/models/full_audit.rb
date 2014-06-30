class FullAudit
  include Mongoid::Document
  belongs_to :audit
end
