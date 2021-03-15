class ContactForm < ApplicationRecord

	before_save :save_last_rut_digits
	has_many :monthly_incomes, :foreign_key => "last_digits", 
                   				:primary_key => "last_digits"

	def save_last_rut_digits
		self.last_digits = self.rut.tr(".", "").tr("-","").last(4).to_s || 0000
	end

end
