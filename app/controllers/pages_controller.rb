class PagesController < ApplicationController

  def start_exam
    unless params[:category].blank?
      @category_id = Category.find_by(category: params[:category]).id
      @exams=Exam.where(category_id: @category_id)
    end
  end
  
end
