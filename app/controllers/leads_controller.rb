class LeadsController < ApplicationController

  def index
    @leads = Lead.all
    @lead = Lead.find_by_id(params[:id])
    @user = current_user
    @sorted_leads = @leads.sort.reverse
  end

  def show
    @lead = Lead.find_by_id(params[:id])
    @leads = Lead.all
    # @reserved_leads = @lead.reverse_orders.where(selector_id: current_user.id)

    #@order = @lead.reverse_orders.where(selector_id: current_user.id)
  end

  def new
    session[:lead_params] ||= {}
    @lead = Lead.new(session[:lead_params])
    @lead.current_step = session[:lead_step]
     @business_types = [
      ["#{I18n.t'lead-new.form.business-types.field-11'}"],
      ["#{I18n.t'lead-new.form.business-types.field-1'}"],
      ["#{I18n.t'lead-new.form.business-types.field-2'}"],
      ["#{I18n.t'lead-new.form.business-types.field-3'}"],
      ["#{I18n.t'lead-new.form.business-types.field-4'}"],
      ["#{I18n.t'lead-new.form.business-types.field-5'}"],
      ["#{I18n.t'lead-new.form.business-types.field-6'}"],
      ["#{I18n.t'lead-new.form.business-types.field-7'}"],
      ["#{I18n.t'lead-new.form.business-types.field-8'}"],
      ["#{I18n.t'lead-new.form.business-types.field-9'}"],
      ["#{I18n.t'lead-new.form.business-types.field-10'}"]
    ]

    @time = [
      ["#{I18n.t'lead-new.form.form-time.fourteendays'}"],
      ["#{I18n.t'lead-new.form.form-time.onetothreemonths'}"],
      ["#{I18n.t'lead-new.form.form-time.flexible'}"],
      ["#{I18n.t'lead-new.form.form-time.consulting'}"],
      ["#{I18n.t'lead-new.form.form-time.informative'}"]
    ]
  end

  def share
    session[:lead_params] ||= {}
    @lead = Lead.new(session[:lead_params])
    @lead.current_step = session[:lead_step]
     @business_types = [
      ["#{I18n.t'lead-new.form.business-types.field-1'}"],
      ["#{I18n.t'lead-new.form.business-types.field-2'}"],
      ["#{I18n.t'lead-new.form.business-types.field-3'}"],
      ["#{I18n.t'lead-new.form.business-types.field-4'}"],
      ["#{I18n.t'lead-new.form.business-types.field-5'}"],
      ["#{I18n.t'lead-new.form.business-types.field-6'}"],
      ["#{I18n.t'lead-new.form.business-types.field-7'}"],
      ["#{I18n.t'lead-new.form.business-types.field-8'}"],
      ["#{I18n.t'lead-new.form.business-types.field-9'}"],
      ["#{I18n.t'lead-new.form.business-types.field-10'}"]
    ]

    @time = [
      ["#{I18n.t'lead-new.form.form-time.fourteendays'}"],
      ["#{I18n.t'lead-new.form.form-time.onetothreemonths'}"],
      ["#{I18n.t'lead-new.form.form-time.flexible'}"],
      ["#{I18n.t'lead-new.form.form-time.consulting'}"],
      ["#{I18n.t'lead-new.form.form-time.informative'}"]
    ]

    # render 'share', layout: 'adwords_layout'
  end

  def create
    session[:lead_params].deep_merge!(lead_params) if (lead_params)
    @lead = Lead.new(session[:lead_params])
    @lead.current_step = session[:lead_step]
    if params[:back_button]
      @lead.previous_step
    elsif @lead.last_step?
        @lead.save
    else
      @lead.next_step
    end
    session[:lead_step] = @lead.current_step
    if @lead.save
      auto_create_user!(@lead)
      session[:lead_step] = session[:lead_params] = nil
      lead_user = @lead.email
      lead = @lead
      UserMailer.send_new_lead(lead)
      redirect_to leads_url
    else
      redirect_to leads_new_url
    end
  end


  def update
      @lead = Lead.find(params[:id])
  end

  def destroy
     @lead = Lead.find_by_id(params[:id])
  end



  private

  def lead_params
    params.require(:lead).permit(
      :name,
      :email,
      :title,
      :description,
      :zip,
      :link,
      :phone,
      :business_type,
      :picture,
      :time,
      :location,
      :selector_id,
      :selected_id,
      :payer_id,
      :paid_id,
      :paid
    )
  end

  def auto_create_user!(lead)
    if user_signed_in?
      lead.user_id = current_user.id
    else
      user = User.find_by_email(lead.email)
      if user
        lead.user_id = user.id
      else
        pass = SecureRandom.hex[0..7]
        user = User.create!(
                 email: lead.email,
                 password: pass,
                 password_confirmation: pass
               )
        lead.user_id = user.id
        user.leads << lead
        UserMailer.welcome_email(user, pass).deliver
        beta = user
        User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Congrats on creating your account. I noticed you haven't set up your profile. The longer you wait, the more clients you're missing out on. Log in, add your information, and upload the best three examples of your work (projects). Once you do, I'll have a chance to review your profile. If you have questions, please contact me and I'll get back to you shortly.", ":)")
      end
    end
    lead.save
  end


  def current_lead
    current_lead=(lead)
    @current_lead = lead
  end

end
