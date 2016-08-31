class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  # student POST   /student
  def create
    @student = Student.create(student_params)

    @student.save
    # redirect_to @student

    if @student.save
      redirect_to students_index_path
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
    @student = Student.find(id_param)
    @id = id_param
  end
  # GET    /student
  def show
    @student = Student.find(id_param)
  end
  # PATCH  /students(.:format)                students#update
  def update
    @student = Student.find(id_param)

    if @student.update(student_params)
      redirect_to students_index_path
    else
      render 'edit'
    end
  end
  # DELETE /student
  def destroy
    @student = Student.find(id_param)
    @student.destroy

    redirect_to students_index_path
  end

  def finish_signup
    if request.patch? && params[:student]
      #if @student.update(student_params)
       # sign_in(@student, bypass: true)
      @student = FormStudent.find_by_email(student_params[:email])
      redirect_to root_path
      #else
      #  @show_errors = true
      #end
    end
  end

  def ensure_signup_complete
    return if action_name == "finish_signup"
    if current_student && !current_student.email_verified?
      redirect_to finish_signup_path(current_student)
    end
  end

  private
  def student_params
    params.require(:student).permit(:id, :first_name, :last_name)
  end

  private
  def id_param
    params[:id]
  end
end
