class StudentController < ApplicationController
  #validates :fist_name, presence: true,
  #                  length: { minimum: 1 }
  def index
    @students = Student.all
  end
  # student POST   /student
  def create
    @student = Student.new(params[:student])
 
    @student.save
    # redirect_to @student

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end
  # new_student GET    /student/new
  def new
    @student = Student.new
  end
  # edit_student GET    /student
  def edit
    @student = Student.find(params[:id])
  end
  # GET    /student
  def show
    @student = Student.find(params[:id])
  end
  # PATCH or PUT  /student
  def update
    @student = Student.find(params[:id])
 
    if @student.update(article_params)
      redirect_to @student
    else
      render 'edit'
    end
  end
  # DELETE /student
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
   
    redirect_to student_path
  end
  
  private
  def article_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
