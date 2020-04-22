class ExperiencesController < ApplicationController
  # GET experiences/
  def index
    @experiences = Experience.all
    @amount_rating = Experience.amount_rating
  end

  # GET experiences/new
  def new
    @experience = Experience.new
  end

  # POST experiences/
  def create
    @experience = Experience.new(experience_params)
    if @experience.save
      flash[:info] = 'Event added'
    else
      flash[:error] = @experience.errors
    end
    redirect_to experiences_path
  end

  protected

  def experience_params
    params.fetch(:experience).permit(:name, :rating).to_h.merge(client_ip: client_ip)
  end
end