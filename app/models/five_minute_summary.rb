class FiveMinuteSummary
  include Mongoid::Document

  belongs_to :audit
  embeds_many :sections



end
