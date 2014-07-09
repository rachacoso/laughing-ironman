class ContentBlock
  include Mongoid::Document

  FMS_DISPLAY_TYPES = {
    'plain_text' => "Plain Text",
    'key_finding' => "Key Finding",
    'unordered_list' => "Unordered List",
    'h1' => "Header One",
    'h2' => "Header Two",
    'h3' => "Header Three",
    'h4' => "Header Four"
  }

  field :content, type: String
  field :display_type, type: String
	validates :content, presence: true

  belongs_to :section
  has_many :inline_photos

end
