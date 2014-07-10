class ContentBlock
  include Mongoid::Document



  field :content, type: String
  field :display_type, type: String
	validates :content, presence: true

  belongs_to :section
  has_many :inline_photos

end
