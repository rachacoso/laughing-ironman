class ContentBlock
  include Mongoid::Document

  embedded_in :section
  
end
