class ContactFormsController < ApplicationController
 
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash.now[:notice] = 'Mensaje enviado con éxito'
    else
      flash[:error] = 'Error al enviar el mensaje'      
      render :new
    end
    rescue ScriptError
      flash[:error] = 'Error al enviar el mensaje'
  end
  
end
