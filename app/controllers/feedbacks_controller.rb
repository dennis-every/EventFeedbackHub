class FeedbacksController < ApplicationController
  def index
    feedbacks = Feedback.includes(:event).order(created_at: :desc)
    feedbacks = feedbacks.where(event_id: params[:event_id]) if params[:event_id].present?
    feedbacks = feedbacks.where(rating: params[:rating]) if params[:rating].present?

    @feedbacks = feedbacks.paginate(page: params[:page], per_page: 2)
    @events = Event.order(name: :asc)
  end

  def create
    @events = Event.order(name: :asc)

    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    else
      render :index
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:event_id, :comment, :rating)
  end
end
