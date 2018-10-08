class ScoresController < ApplicationController
  def create
		if params['answer'].blank?
			render json: {"error":"You didn't attempt any question"}
		else
			@exam = Exam.find(params["exam_id"].to_i)

			score = 0
			@answers_by_user = []
			mark_correct_question = []
			@correct_ids = []

			@exam.questions.each do |question|
				question.answers.each do |answer|
					if answer.correct == true
						@correct_ids << answer.id
					end
				end
			end

			params["answer"].each do |answer|
				@answers_by_user << Answer.find((answer.to_i))
			end

			@answers_by_user.each do |check_answer|
				if check_answer.correct == true
					score += 1
						mark_correct_question << Question.find(check_answer.question_id).id
				end
			end
			score_last = (score.to_f / (params["answer"].length)) * 100
			@score = Score.create(user_id:current_user.id, category_id: @exam.category_id, exam_id: @exam.id, score_value: score_last.to_i)

			no_of_score = Score.where(user_id:current_user.id,exam_id:@exam.id).all.length
			if no_of_score == 6
				Score.where(user_id:current_user.id,exam_id:@exam.id).first.destroy
				no_of_score = Score.where(user_id:current_user.id,exam_id:@exam.id).all.length
			end
			Score.where(user_id: current_user.id, exam_id: @exam.id).each do |each_score|
				@total_score = each_score.score_value.to_i + @total_score.to_i
				@average_score = @total_score/5
			end

			# if no_of_score == 5
			# 	Score.where(user_id: current_user.id, exam_id: @exam.id).each do |each_score|
			# 		@total_score = each_score.score_value.to_i + @total_score.to_i
			# 		@average_score = @total_score/5
			# 	end
			# end

			if @average_score
				@recent_score =RecentScore.find_or_initialize_by(user_id:current_user.id, exam_id:@exam.id, category_id:@exam.category_id)
				@recent_score.update_attributes(:user_id => current_user.id,:exam_id => @exam.id, :temp => @average_score)
			end

			render json: {score_info: @score, correct_ids: @correct_ids, correct_question_id: mark_correct_question, total_score: @total_score, average_score: @recent_score}
    end
	end

	def index
		@ave_physics=Score.where(user_id:current_user.id, category_id:1).average(:score_value).to_i
		@ave_maths=Score.where(user_id:current_user.id, category_id:2).average(:score_value).to_i
		@ave_chemistry=Score.where(user_id:current_user.id, category_id:3).average(:score_value).to_i
		@ave_english=Score.where(user_id:current_user.id, category_id:4).average(:score_value).to_i
		# @ave_miscellaneous=Score.where(user_id:current_user.id, category_id:5).average(:score_value).to_i
	@yoyo=Score.where(user_id:current_user.id).last(10)
	end

end


