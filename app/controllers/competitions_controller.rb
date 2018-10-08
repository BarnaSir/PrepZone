class CompetitionsController < ApplicationController

  def index
		@start=Time.now.beginning_of_week(start_day= :sunday)
		@end=Time.now.end_of_week(start_day=:sunday)
		@range=@start..@end
		# @this_week_competition=Competition.where(starting_date: @range)
		if Competition.where(starting_date: @range).nil?
			@id= 	Competition.last.id
			@this_week_competition = Competition.create(name: @id, category_id: rand(1..5), starting_date: @start)
		else
			@this_week_competition=Competition.where(starting_date: @range)
		end

		@visible_score=Competescore.where(user_id: current_user.id, created_at: (Time.now-100.year)..@start).last
		@recent_scores=Competescore.where(user_id:current_user.id, created_at: (Time.now-100.year)..@start).last(6).to_a
		@recent_scores.pop
		if @visible_score
			if Time.now > @visible_score.created_at.end_of_week(start_day= :sunday)
				@visible_score
			else
				@visible_score=nil
			end
		end
  end

	def new
		@competition=Competition.new	
	end
	def create
		@competition=Competition.create(competition_params)
		if @competition.save
			flash[:notice]="success!"
			redirect_to new_competition_path
		else
			render 'new'
		end
	end

	def increase_i
		if params[:i].blank?
			@i=0
			$counting=0
		else
			@i=params[:i].to_i+1
			$counting=$counting+1
		end
		# if @i!=100
		if @i!=5
			@question = $rand_question[@i].question_content
			@options= $rand_question[@i].answers
			if params[:user_choice].present?
				@answer=Answer.find_by(id: params[:user_choice])
				if @answer.correct
					$compete_score=$compete_score.to_i+1
				end
			end
		else
			Competescore.create(score:$compete_score, user_id: current_user.id, competition_id: $competition.id)

			@counter=1
			Competescore.where(competition_id: $competition.id).sort_by{|data| data.score}.reverse!.each do |competescore|
				competescore.rank=@counter
				competescore.save
				@counter=@counter+1
			end
		end
	end

	def time_finished
			Competescore.create(score:$compete_score, user_id: current_user.id, competition_id: $competition.id)
			@counter=1
			Competescore.where(competition_id: $competition.id).sort_by{|data| data.score}.reverse!.each do |competescore|
				competescore.rank=@counter
				competescore.save
				@counter=@counter+1
			end
	end

	def show
		$competition=nil
		$competition=Competition.friendly.find(params[:id])
		@already_competed=Competescore.find_by(user_id: current_user.id, competition_id: $competition.id)
		$rand_question=Question.order("RANDOM()").limit(5)
		$compete_score=nil
	end

	private

	def competition_params
		params.require(:competition).permit(:name,:category_id,:starting_date)
	end

end

