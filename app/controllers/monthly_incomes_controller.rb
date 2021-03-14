class MonthlyIncomesController < ApplicationController
  before_action :set_monthly_income, only: %i[ show edit update destroy ]

  # GET /monthly_incomes or /monthly_incomes.json
  def index
    @monthly_incomes = MonthlyIncome.all
  end

  # GET /monthly_incomes/1 or /monthly_incomes/1.json
  def show
  end

  def incomes_from_floid
    binding.pry
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
