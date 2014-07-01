class ContentBlock
  include Mongoid::Document


  field :content, type: String

  belongs_to :section

end
