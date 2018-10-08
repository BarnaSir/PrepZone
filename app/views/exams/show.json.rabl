object @exam

child :questions do
attributes :question_content, :id
	child :answers do
		attributes :answer_content, :id
	end
end


