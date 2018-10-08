class ExamsController < ApplicationController

  def start
  end

  def index
		unless params[:category] =="Physics" || params[:category]=="Maths" || params[:category]=="Chemistry"|| params[:category]=="English"|| params[:category]=="Aptitute"
			redirect_to dashboard_path
		end
		@category = Category.find_by(category: params[:category])
    @practises=Exam.where(category: @category)
  end

 	def show
	  		   begin
      @exam=Exam.friendly.find(params[:id])
			@questions=@exam.questions
			# render json:@questions
		total_score = 0
		average_score = 0
			 Score.where(user_id: current_user.id, exam_id: @exam.id).each do |each_score|
			 	total_score = each_score.score_value.to_i + total_score.to_i
			 	average_score = total_score/5
			 end
			 @total_score=total_score
			 @average_score=average_score
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end
end
