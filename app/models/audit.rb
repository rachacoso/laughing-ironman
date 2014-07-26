class Audit
  include Mongoid::Document
  field :name, type: String
  field :publication_date, type: Date

  validates :name, presence: true, uniqueness: true
	validates :publication_date, presence: true

  has_one :five_minute_summary, :dependent => :destroy
  has_one :full_audit, :dependent => :destroy
  has_many :inline_photos, :dependent => :destroy

  has_one :public_five_minute_summary, class_name: 'PublicContent', :dependent => :destroy, inverse_of: :public_five_minute_summary_audit
  has_one :public_full_audit, class_name: 'PublicContent', :dependent => :destroy, inverse_of: :public_full_audit_audit

# has_many :posted_to_user, class_name: "Post", inverse_of: :posted_to

  def generate_new_fms

  		sections = {
  			'FMSsummary' => 'Summary',
  			'FMSbackground' => 'Background',
  			'FMSfindings' => 'Findings and Recommendations'
  		}

  		self.five_minute_summary.section_order = Array.new
  		sections.each do |st, dn|
	  		newsection = Section.new(section_type: st, display_name: dn)
        newsection.save!
        newsection.setcontent
	   		self.five_minute_summary.sections << newsection
	   		self.five_minute_summary.section_order << newsection.id
	   	end 
	   	self.five_minute_summary.save!

  end

  def generate_new_fa

    # default section setup
    sections = [
      'Executive Summary',
      'Audit Action Plan',
      'Introduction and Background',
      'Findings and Recommendations'
    ]

    self.full_audit.section_order = Array.new
    sections.each do |dn|
      newsection = Section.new(section_type: 'full_audit_section', display_name: dn)
      newsection.save!
      newsection.setcontent
      self.full_audit.sections << newsection
      self.full_audit.section_order << newsection.id
    end 
    self.full_audit.save!

  end

  def published?
    # checking if any of the needed sections are missing before allowing viewing
    published = false
    if self.public_five_minute_summary && self.public_full_audit
      unless self.public_five_minute_summary.public_sections.empty? || self.public_full_audit.public_sections.empty?
        published = true
      end
    end
  end

end
