class SchoolsController < ApplicationController
  def new
  end
  
  def create
    @school = School.new(school_params)
    @school.save
    
    redirect_to @school
  end
  
  def show
    @school = School.find(params[:id])
  end
  
  def index
    @schools = School.all
  end
  
  def edit
    @school = School.find(params[:id])
  end
  
  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to @school
    else
      render "edit"
    end
  end
  
  private
  def school_params
    params.require(:school).permit(:name, :street_address, :city, :state, :zip_code, :phone_number, :fax_number, :website)
  end
end
