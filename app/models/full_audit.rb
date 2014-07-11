class FullAudit
  include Mongoid::Document

  field :section_order, type: Array # for display order of sections

  belongs_to :audit
  has_many :sections, :dependent => :destroy

	has_one :background_photo, :dependent => :destroy
  accepts_nested_attributes_for :sections, :audit

end
