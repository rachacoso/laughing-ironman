class ContentBlock
  include Mongoid::Document


  field :content, type: String
	validates :content, presence: true

  belongs_to :section

end
