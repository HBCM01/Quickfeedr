class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @jobs = Job.all
  end

  def recruitment_dashboard
    @user = current_user
    search
  end

  def my_profile
    @user = current_user
    @job_applications = JobApplication.where(user: current_user.id)
  end

  def applicant_profile
    @applicant_profile = User.find(params[:id])
    # @applicant_profile.job = Job.find(params[:id])

  end

  private

  def search
    if params[:query].present?
      @jobs = Job.search_by_title_and_location(params[:query])
    else
      @jobs = Job.where(user: @user)
    end
  end
end
