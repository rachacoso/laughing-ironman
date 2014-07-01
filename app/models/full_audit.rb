class FullAudit
  include Mongoid::Document

  field :block_order, type: Array

  belongs_to :audit
  
end
