class ContactFormMailer < ApplicationMailer

	def new_contact_email
	    @contact_form = params[:contact_form]

	    mail(to: "cristobal.cerda@hogarizate.cl", subject: "Nuevo Registro - Hogarizate")
	 end


end


