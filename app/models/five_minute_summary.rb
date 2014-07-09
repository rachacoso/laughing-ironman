class FiveMinuteSummary
  include Mongoid::Document

  field :section_order, type: Array # for display order of sections


  belongs_to :audit
  has_many :sections, :dependent => :destroy

  has_one :first_background_photo, class_name: 'BackgroundPhoto', :dependent => :destroy, inverse_of: :fms_bg_one
  has_one :second_background_photo, class_name: 'BackgroundPhoto', :dependent => :destroy, inverse_of: :fms_bg_two
  has_one :third_background_photo, class_name: 'BackgroundPhoto', :dependent => :destroy, inverse_of: :fms_bg_three
  has_one :fourth_background_photo, class_name: 'BackgroundPhoto', :dependent => :destroy, inverse_of: :fms_bg_four
  has_one :fifth_background_photo, class_name: 'BackgroundPhoto', :dependent => :destroy, inverse_of: :fms_bg_five

	accepts_nested_attributes_for :sections, :audit

end
