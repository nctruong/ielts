class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback('facebook')
  end

  def google_oauth2
    generic_callback('google_oauth2')
  end

  def generic_callback(provider)
    # Identity object for incoming data
    @identity = Identity.find_for_oauth env["omniauth.auth"] # identity will be created in this method

    # if identity has no student => student is existing in db => student = current student
    @student = @identity.student || current_student

    # if having no current student
    if @student.nil?
      # creating new record for new student
      # @student = Student.create(email: @identity.email)# || "")
      @student = Student.find_by_email(@identity.email)
      if @student.nil?
        @student = Student.create(email: @identity.email)# || "")
      end
      # update student_id in identity table
      @identity.update_attribute(:student_id, @student.id)
    end

    # if student does not have email yet => set the email from incoming data
    if @student.email.blank? && @identity.email
      @student.update_attribute(:email, @identity.email)
    end

    # if student is existing =>
    if @student.persisted?
      @identity.update_attribute(:student_id, @student.id)
      # This is because we've created the student manually, and Device expects a
      # FormStudent class (with the validations)
      @student = FormStudent.find @student.id
      #sign_in_and_redirect @student, event: :authentication

      # sign in, set current_student
      sign_in @student, event: :authentication

      if @student.email?
        redirect_to root_path
      else
        redirect_to finish_signup_path(@student)
      end


      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      # having no account on facebook, google => registration
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_student_registration_url
    end
  end
end
