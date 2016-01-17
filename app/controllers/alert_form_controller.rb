# Alert
class AlertFormController < ApplicationController
  def new
    @alert = Admin::Alert.new
  end

  def create
    @alert = Admin::Alert.new(alert_params)

    respond_to do |format|
      if @alert.save
        format.html do
          redirect_to root_path, notice: 'Alert was successfully sent.'
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def alert_params
    params.require(:admin_alert).permit(:description, :category, :email)
  end
end
