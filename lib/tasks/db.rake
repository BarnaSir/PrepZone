namespace :db do
	desc "populates the database with random data "
	task populate: :environment do
		require 'faker'
		include Faker

			@exam_id=1
			@question_id=1
		50.times do 
			Exam.create!(
				id: @exam_id, name: Name.name, category_id: Number.between(1,5)
			)
			10.times do
				Question.create!(id: @question_id, exam_id: @exam_id, question_content: Lorem.sentence)	
				4.times do
					Answer.create!(answer_content: Lorem.sentence,  correct: Boolean.boolean,question_id: @question_id )
				end
				@question_id=@question_id+1
			end
      @exam_id=@exam_id+1
		end
	end
end
