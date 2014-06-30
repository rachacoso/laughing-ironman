class ContentBlock
  include Mongoid::Document


  field :content, type: String
  field :position, type: Float

  belongs_to :section

end
