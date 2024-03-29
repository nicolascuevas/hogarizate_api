class ContactFormsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [ :create ]
  before_action :set_contact_form, only: %i[ show edit update destroy ]

  # GET /contact_forms or /contact_forms.json
  def index
    income_type_query = ">=";
    if params[:income_type] == "gt"
      income_type_query = ">=";
    elsif params[:income_type] == "lt"
        income_type_query = "<=";
    elsif params[:income_type] == "et"
         income_type_query = "="; 
    end
    @contact_forms = ContactForm.all
    @contact_forms = @contact_forms.where("rut ilike '%#{params[:rut]}%'") if params[:rut].present?
    @contact_forms = @contact_forms.where("first_name ilike '%#{params[:first_name]}%'") if params[:first_name].present?
    @contact_forms = @contact_forms.where("last_name ilike '%#{params[:last_name]}%'") if params[:last_name].present?
    @contact_forms = @contact_forms.where("email ilike '%#{params[:email]}%'") if params[:email].present?
    @contact_forms = @contact_forms.where("average_income #{income_type_query} #{params[:income]}") if params[:income].present?
  end

  # GET /contact_forms/1 or /contact_forms/1.json
  def show
    
  end

  # GET /contact_forms/new
  def new
    @contact_form = ContactForm.new
  end

  # GET /contact_forms/1/edit
  def edit
  end

  # POST /contact_forms or /contact_forms.json
  def create
    @contact_form = ContactForm.new(contact_form_params)

    respond_to do |format|
      if @contact_form.save
        ContactFormMailer.with(contact_form: @contact_form).new_contact_email.deliver_later
        format.html { redirect_to @contact_form, notice: "Contact form was successfully created." }
        format.json { render :show, status: :created, location: @contact_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_forms/1 or /contact_forms/1.json
  def update
    respond_to do |format|
      if @contact_form.update(contact_form_params)
        format.html { redirect_to @contact_form, notice: "Contact form was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_forms/1 or /contact_forms/1.json
  def destroy
    @contact_form.destroy
    respond_to do |format|
      format.html { redirect_to contact_forms_url, notice: "Contact form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_form
      @contact_form = ContactForm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_form_params
      params.require(:contact_form).permit(:first_name, :last_name, :email, :phone, :rut, :last_digits)
    end
end
