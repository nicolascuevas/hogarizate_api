class ConstantsController < ApplicationController
  before_action :set_constant, only: %i[ show edit update destroy ]
  before_action :set_by_name, only: [ :by_name ]

  # GET /constants or /constants.json
  def index
    @constants = Constant.all
  end

  # GET /constants/1 or /constants/1.json
  def show
  end

  # GET /constants/1 or /constants/1/by_name.json
  def by_name
  end

  # GET /constants/new
  def new
    @constant = Constant.new
  end

  # GET /constants/1/edit
  def edit
  end

  # POST /constants or /constants.json
  def create
    @constant = Constant.new(constant_params)

    respond_to do |format|
      if @constant.save
        format.html { redirect_to @constant, notice: "Constant was successfully created." }
        format.json { render :show, status: :created, location: @constant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @constant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constants/1 or /constants/1.json
  def update
    respond_to do |format|
      if @constant.update(constant_params)
        format.html { redirect_to @constant, notice: "Constant was successfully updated." }
        format.json { render :show, status: :ok, location: @constant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @constant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constants/1 or /constants/1.json
  def destroy
    @constant.destroy
    respond_to do |format|
      format.html { redirect_to constants_url, notice: "Constant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constant
      @constant = Constant.find(params[:id])
    end

    def set_by_name
      @constant = Constant.where(name: params[:name]).first
    end

    # Only allow a list of trusted parameters through.
    def constant_params
      params.require(:constant).permit(:name, :value)
    end
end
