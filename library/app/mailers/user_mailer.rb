class UserMailer < ApplicationMailer
 
  def book_detail
    @user = params[:user]
    mail(to: @user, subject: 'Welcome')
  end

end
