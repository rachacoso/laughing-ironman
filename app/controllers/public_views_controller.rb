class PublicViewsController < ApplicationController

  skip_before_action :require_login, only: [:fms, :fa]

	layout :get_layout

	def fms
		@audit = Audit.find(params[:id])
    if @audit.published?
      @fms = @audit.public_five_minute_summary
    else
      redirect_to '/404audit.html'
    end      
	end

	def fa
		@audit = Audit.find(params[:id])
    if @audit.published?
      @fa = @audit.public_full_audit
    else
      redirect_to '/404audit.html'
    end     
	end

  def publish
    audit = Audit.find(params[:id])
    fms = audit.five_minute_summary
    fa = audit.full_audit
    publish = params[:switch].to_i # 1 for yes, 0 for no

    # clear old versions
    audit.public_five_minute_summary = nil
    audit.public_full_audit = nil
    
    if publish == 1

      # five_minute_summary
      public_fms = audit.create_public_five_minute_summary
      public_fms.name = audit.name
      public_fms.publication_date = audit.publication_date

      p_a = audit.five_minute_summary.first_background_photo ? audit.five_minute_summary.first_background_photo.photo(:large) : ""
      p_b = audit.five_minute_summary.second_background_photo ? audit.five_minute_summary.second_background_photo.photo(:large) : ""
      p_c = audit.five_minute_summary.third_background_photo ? audit.five_minute_summary.third_background_photo.photo(:large) : ""
      p_d = audit.five_minute_summary.fourth_background_photo ? audit.five_minute_summary.fourth_background_photo.photo(:large) : ""
      p_e = audit.five_minute_summary.fifth_background_photo ? audit.five_minute_summary.fifth_background_photo.photo(:large) : ""

      public_fms.background_photos = [ p_a, p_b, p_c, p_d, p_e ]
      public_fms.save!
      fms.sections.each do |s|
        s_name = s.display_name
        s_type = s.section_type
        pub_content = String.new
        s.block_order.each do |block|
          pub_content << ContentBlock.find(block).content
        end
        public_fms.public_sections.create(
          display_name: s_name, 
          section_type: s_type, 
          content: pub_content
        )
      end

      # full_audit
      public_fa = audit.create_public_full_audit
      public_fa.name = audit.name
      public_fa.publication_date = audit.publication_date

      bgp = audit.full_audit.background_photo ? audit.full_audit.background_photo.photo(:large) : ""

      public_fa.background_photos = [ bgp ]
      public_fa.save!
      fa.section_order.each do |so|
        s = fa.sections.find(so)
        s_name = s.display_name
        s_type = s.section_type
        s_id = s.id
        pub_content = String.new
        s.block_order.each do |block|
          pub_content << ContentBlock.find(block).content
        end
        public_fa.public_sections.create(
          display_name: s_name, 
          section_type: s_type, 
          section_id: s_id, 
          content: pub_content
        )
      end

    end

    redirect_to audits_url

  end

  private

  def get_layout
    case action_name
    when "fms"
      "five_minute_summary"
    when "fa"
      "full_audit"
    else
      "application"
    end
  end

end