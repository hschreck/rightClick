class MainController < ApplicationController
  def home
    if @action = params[:invAction]
      @drive = params[:drive]
      case @action
      when "add"
        @message="Added #{@drive}"
        addDrive = Inventory.new
        addDrive.drive = @drive
        addDrive.save
      when "remove"
        @message = "Couldn't remove #{@drive}: Already Zero"
        if !(Inventory.where("drive = ?", @drive).blank?)
          removeDrive = Inventory.where("drive = ?", @drive).last
          removeDrive.delete
          @message = "Removed #{@drive}"
        end
      end
      redirect_to(controller: 'main', action: 'home', message: @message)
    end

    params[:message] ||= "Keep up the good work!"
    @message ||= params[:message]
    @drives = Drive.all
  end

end
