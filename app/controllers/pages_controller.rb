class PagesController < ApplicationController
  def settings
    @settings = Setting.all
  end

  def save_settings
    settings = params[:setting]
    settings.each do |id, setting|
      Setting.find(id).update_attributes(setting)
    end
    flash.now[:notice] = "Settings saved."
    @settings = Setting.all
    render "settings"
  end
end
