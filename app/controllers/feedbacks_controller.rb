class FeedbacksController < ApplicationController
  def index
    feedbacks = Feedback.includes(:event).order(created_at: :desc)
    feedbacks = feedbacks.where(event_id: params[:event_id]) if params[:event_id].present?
    feedbacks = feedbacks.where(rating: params[:rating]) if params[:rating].present?

    @feedbacks = feedbacks.paginate(page: params[:page], per_page: 2)
    @events = Event.order(name: :asc)
    @feedback = Feedback.new
  end

  def create
    @events = Event.order(name: :asc)
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash.now[:notice] = "Thank you for your feedback!"
      @feedback = Feedback.new
      respond_to do |format|
        format.turbo_stream
      end
    else
      flash.now[:alert] = @feedback.errors.full_messages.to_sentence
      @feedbacks = Feedback.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("flash", partial: "shared/flash"),
            turbo_stream.replace("feedback_form", partial: "feedbacks/form", locals: { feedback: @feedback, events: @events })
          ]
        end
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:event_id, :comment, :rating)
  end
end
