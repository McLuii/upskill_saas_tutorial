class ContactsController < ApplicationController
  
  # GET Request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new 
  end
    
    
  # POST request /contacts
  def create
    # Mass assignment of form fields into Contact object
   @contact = Contact.new(contact_params)
   #Save the Contact object to the database and if the save goes through...
    if @contact.save
      # Store form fields via. params, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into the Contact Mailer mail method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash
      # Redirect to the new action
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      # Store error message in flash has if Contact object doesn't save
      # Redirect to new action
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
    #To collect data from form we need to use
    #strong params and whitelist the form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
    
end