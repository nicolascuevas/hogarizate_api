class MonthlyIncomesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:incomes_from_floid]
  skip_before_action :authenticate_user!, only: [:incomes_from_floid]
  before_action :set_monthly_income, only: %i[ show edit update destroy ]

  # GET /monthly_incomes or /monthly_incomes.json
  def index
    @monthly_incomes = MonthlyIncome.all
  end

  # GET /monthly_incomes/1 or /monthly_incomes/1.json
  def show
  end

  def incomes_from_floid

      if params[:consumerId].present?
        #when Floid sends the RUT (identifir) and the caseId but not the incomes
        rut = params[:consumerId].tr(" ", "").tr("-", "")
        contact_form = ContactForm.where(rut: rut).first
        contact_form.case_id = params[:caseId]
        if contact_form.save
          render json: { "info": "OK", "contact": contact_form }
        else
          render json: { "Error": "Rut does not exist" }
        end
      else
        #when floid send the incomes of a contact
        contact_form = ContactForm.where(case_id: params[:caseId]).first
        if contact_form
          if MonthlyIncome.get_json_from_floid(contact_form, params["income"]["incomeByMonth"])
            render json: { "info": "OK" }
          end
        else
          render json: { "Error": "ERROR - caseId dont exist" }
        end
        #MonthlyIncome.get_json_from_floid(params["income"]["incomeByMonth"])
      end

  end

  # GET /monthly_incomes/new
  def new
    @monthly_income = MonthlyIncome.new
  end

  # GET /monthly_incomes/1/edit
  def edit
  end

  # POST /monthly_incomes or /monthly_incomes.json
  def create
    @monthly_income = MonthlyIncome.new(monthly_income_params)

    respond_to do |format|
      if @monthly_income.save
        format.html { redirect_to @monthly_income, notice: "Monthly income was successfully created." }
        format.json { render :show, status: :created, location: @monthly_income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monthly_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_incomes/1 or /monthly_incomes/1.json
  def update
    respond_to do |format|
      if @monthly_income.update(monthly_income_params)
        format.html { redirect_to @monthly_income, notice: "Monthly income was successfully updated." }
        format.json { render :show, status: :ok, location: @monthly_income }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monthly_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_incomes/1 or /monthly_incomes/1.json
  def destroy
    @monthly_income.destroy
    respond_to do |format|
      format.html { redirect_to monthly_incomes_url, notice: "Monthly income was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_income
      @monthly_income = MonthlyIncome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthly_income_params
      params.require(:monthly_income).permit(:contact_form_id, :year, :month, :date, :total, :main, :extra)
    end
end
