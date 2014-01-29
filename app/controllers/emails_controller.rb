class EmailsController < ApplicationController
	# http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @emails = Email.all

  end

  def show
    @email = Email.find(params[:id])
  end

  def create

    # render text: params[:email].inspect

     @email = Email.new(params[:email].permit(:name, :email, :message))

     if @email.save
      redirect_to @email
     else
      render 'index'
     end
  end

end
