class Admin::AlertsController < ApplicationController
  before_action :set_admin_alert, only: [:show, :edit, :update, :destroy]

  # GET /admin/alerts
  # GET /admin/alerts.json
  def index
    @admin_alerts = Admin::Alert.all
  end

  # GET /admin/alerts/1
  # GET /admin/alerts/1.json
  def show
  end

  # GET /admin/alerts/new
  def new
    @admin_alert = Admin::Alert.new
  end

  # GET /admin/alerts/1/edit
  def edit
  end

  # POST /admin/alerts
  # POST /admin/alerts.json
  def create
    @admin_alert = Admin::Alert.new(admin_alert_params)

    respond_to do |format|
      if @admin_alert.save
        format.html { redirect_to @admin_alert, notice: 'Alert was successfully created.' }
        format.json { render :show, status: :created, location: @admin_alert }
      else
        format.html { render :new }
        format.json { render json: @admin_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/alerts/1
  # PATCH/PUT /admin/alerts/1.json
  def update
    respond_to do |format|
      if @admin_alert.update(admin_alert_params)
        format.html { redirect_to @admin_alert, notice: 'Alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_alert }
      else
        format.html { render :edit }
        format.json { render json: @admin_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/alerts/1
  # DELETE /admin/alerts/1.json
  def destroy
    @admin_alert.destroy
    respond_to do |format|
      format.html { redirect_to admin_alerts_url, notice: 'Alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_alert
      @admin_alert = Admin::Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_alert_params
      params.require(:admin_alert).permit(:description, :category, :email, :price, :deadline, :status)
    end
end
