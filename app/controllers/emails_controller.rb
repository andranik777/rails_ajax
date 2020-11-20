class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end
  def create
      Rails.application.load_seed
      respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }

    end
  end
  def show
    @vu = Email.find(params[:id])
    @vu.update(read:true)

    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
      end
      ActiveRecord::Base.connection.reset_pk_sequence!('emails')
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end
  def update
    @email = Email.find(params[:id])
    @email.update(read:false)
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end

  end

end
