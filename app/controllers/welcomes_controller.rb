class WelcomesController < ApplicationController
	def index
		@physics_total=0
		@counter_physics=Exam.where(category_id:1).length
		RecentScore.where(category_id:1).each do |recent|
			@physics_total= @physics_total+recent.temp
		end
		@recent_physics=@physics_total/@counter_physics if @counter_physics

		@maths_total=0
		@counter_maths=Exam.where(category_id:2).length
		RecentScore.where(category_id:2).each do |recent|
			@maths_total= @maths_total+recent.temp
		end
		@recent_maths=@maths_total/@counter_maths if @counter_maths

		@chemistry_total=0
		@counter_chemistry=Exam.where(category_id:3).length
		RecentScore.where(category_id:3).each do |recent|
			@chemistry_total= @chemistry_total+recent.temp
		end
		@recent_chemistry=@chemistry_total/@counter_chemistry if @counter_chemistry

		@english_total=0
		@counter_english=Exam.where(category_id:4).length
		RecentScore.where(category_id:1).each do |recent|
			@english_total= @english_total+recent.temp
		end
		@recent_english=@english_total/@counter_english if @counter_english

		@aptitute_total=0
		@counter_aptitute=Exam.where(category_id:5).length
		RecentScore.where(category_id:2).each do |recent|
			@aptitute_total= @aptitute_total+recent.temp
		end
		@recent_aptitute=@aptitute_total/@counter_aptitute if @counter_aptitute

		if @recent_aptitute
			@ioe_mastery=((@recent_physics*2/7.to_f)+(@recent_maths*2/7.to_f)+(@recent_chemistry*1/7.to_f)+(@recent_english*11/70.to_f)+(@recent_aptitute*9/70.to_f)).round(2)
		end
	end
end
