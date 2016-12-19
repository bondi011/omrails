class SubmissionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]

  # GET /submissions
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  def show
      @submission = Submission.find(params[:id])
  end

  # GET /submissions/new
  def new
    @submission = current_user.submissions.new
  end

  # GET /submissions/1/edit
  def edit
      @submission = current_user.submissions.find(params[:id])
  end

  # POST /submissions
  def create
    @submission = current_user.submissions.new(submission_params)
    if @submission.save
      redirect_to @submission, notice: 'Submission was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /submissions/1
  def update
      @submission = current_user.submissions.find(params[:id])
      if @submission.update(submission_params)
        redirect_to @submission, notice: 'Submission was successfully updated.'
      else
        render :edit
    end
  end

  # DELETE /submissions/1
  def destroy
    @submission = current_user.submissions.find(params[:id])
    @submission.destroy
    redirect_to submissions_url, notice: 'Submission was successfully destroyed.'
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:title, :url, :content)
    end
end
