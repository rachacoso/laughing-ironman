class ContentBlock
  include Mongoid::Document

  FMS_DISPLAY_TYPES = {
  	plain_text => "Plain Text",
		key_finding => "Key Finding"
  }

  field :content, type: String
  field :display_type, type: String
	validates :content, :display_type, presence: true

  belongs_to :section

end
