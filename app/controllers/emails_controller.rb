class EmailsController < ApplicationController
	# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @emails = Email.all

  end

  def show
    @email = Email.find(params[:id])
  end

  def success    
  end

  def create    
     @email = Email.new(params[:email].permit(:name, :email, :message))

     if @email.save
      ContactMailer.obtc_message(@email).deliver
      redirect_to :action => 'success'
     else      
        flash[:email] = @email
        redirect_to :back      
     end
  end

end
