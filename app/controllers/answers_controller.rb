class AnswersController < ApplicationController
  def new
    @ask = Ask.find(params[:ask_id])
    @answer = @ask.answers.new
  end

  def create
    @ask = Ask.find(params[:ask_id])
    @answer = @ask.answers.new(params[:answer])
    @answer.user = logged_in_user
    @answer.save
    redirect_to ask_path(:id => @ask.id)
  end

  def edit
    @ask = Ask.find(params[:ask_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to ask_path(:id => @answer.ask.id)
    else
      render :action => 'edit'
    end
  end

  def set_answer
    @answer = Answer.find(params[:id])
    @answer.update_attributes(:status => true)
    @ask = Ask.find(params[:ask_id])
    @ask.update_attributes(:solved => true)
    redirect_to ask_path(:id => @ask)
  end

end
