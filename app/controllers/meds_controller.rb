class MedsController < ApplicationController
  before_action :signed_in_user
  before_action :set_med, only: [:show, :edit, :update, :destroy]

  # def completed
  #   @med.completed = !@med.completed
  #   respond_to do |format|
  #     if @med.save
  #       format.html { redirect_to meds_path }
  #       format.json { render :show, status: :ok, location: @med }
  #     else
  #       # show some error message
  #     end
  #   end
  # end

  # GET /meds
  # GET /meds.json
  def index
    @meds = current_user.meds.order(created_at: :desc)
  end

  # GET /meds/1
  # GET /meds/1.json
  def show
  end

  # GET /meds/new
  def new
    @med = Med.new
  end

  # GET /meds/1/edit
  def edit
  end

  # POST /meds
  # POST /meds.json
  def create
    @med = Med.new(med_params)
    @med.user = current_user

    respond_to do |format|
      if @med.save
        format.html { redirect_to meds_path, notice: 'Med was successfully created.' }
        format.json { render :show, status: :created, location: @med }
      else
        format.html { render :new }
        format.json { render json: @med.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meds/1
  # PATCH/PUT /meds/1.json
  def update
    respond_to do |format|
      if @med.update(med_params)
        format.html { redirect_to meds_path, notice: 'Med was successfully updated.' }
        format.json { render :show, status: :ok, location: @med }
      else
        format.html { render :edit }
        format.json { render json: @med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meds/1
  # DELETE /meds/1.json
  def destroy
    @med.destroy
    respond_to do |format|
      format.html { redirect_to meds_url, notice: 'Med was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_med
      @med = Med.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def med_params
      params.require(:med).permit(:title, :directions, :comments)
    end
end

    # params come from url. if they're trying to get a todo that doesnt belong to them, they get redirected somewhere else.
    def verify_correct_user
      @med = current_user.med_params.find_by(id: params[:id])
      redirect_to root_url, notice: 'You are are being watched!' if @med.nil?
    end
