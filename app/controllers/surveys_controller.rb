class SurveysController < ApplicationController
  before_action :set_survey, only: [:update, :show]
  include ResponseConcern


  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      success(data: @survey , msg: 'Survey Created Successfully')
    else
      error(msg: @survey.errors)
    end
  end

  def update
    if @survey.update(survey_params)
      success(data: @survey, msg: 'Survey Updated Successfully')
    else
      error(msg: @survey.errors)
    end
  end

  def show
    success(data: @survey.as_json(include: :components), msg: "Survey Fetched Successfully")
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
    not_found(msg: "Record not found") unless @survey
  end

  def survey_params
    params.require(:survey).permit(:name, :description, components_attributes: [:id, :kind, :content, :x, :y, :_destroy])
  end
end
