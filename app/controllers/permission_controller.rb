class PermissionController < ApplicationController
  def sign_in
  end

  def sign_up
    
  end

  def sign_out
  end

  def index
    @student = Student.create(first_name: "Truong", last_name: "Nguyen", username: "truong", password: "truong", sex: "M", phone: "0947158258", email: "nctruong861990@gmail.com", avatar: "D:", student_level: "0", country: "Vietnam", birthday: "08/06/1990")
  end
end
