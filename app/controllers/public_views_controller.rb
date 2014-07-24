class PublicViewsController < ApplicationController

  skip_before_action :require_login, only: [:fms, :fa]

	layout :get_layout

	def fms
		@fms = FiveMinuteSummary.find(params[:id])

	end

	def fa
		@fa = FullAudit.find(params[:id])

	end

  def publish
    audit = Audit.find(params[:id])
    fms = audit.five_minute_summary
    fa = audit.full_audit
    publish = params[:switch].to_i # 1 for yes, 0 for no

    # clear old versions
    if audit.public_five_minute_summary
      audit.public_five_minute_summary = nil
    end
    if audit.public_full_audit
      audit.public_full_audit = nil
    end

    puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    puts publish
    if publish == 1
      puts "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
      public_fms = audit.create_public_five_minute_summary
      fms.sections.each do |s|
        section_name = s.display_name
        pub_content = String.new
        s.block_order.each do |block|
          pub_content << ContentBlock.find(block).content
        end
        public_fms.public_sections.create(display_name: section_name, content: pub_content)
      end

      public_fa = audit.create_public_full_audit
      fa.sections.each do |s|
        section_name = s.display_name
        pub_content = String.new
        s.block_order.each do |block|
          pub_content << ContentBlock.find(block).content
        end
        public_fa.public_sections.create(display_name: section_name, content: pub_content)
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