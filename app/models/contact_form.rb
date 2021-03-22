class ContactForm < ApplicationRecord

	before_save :save_last_rut_digits
	has_many :monthly_incomes

	def save_last_rut_digits
		self.rut = self.rut.tr(".", "").tr("-","")
		self.last_digits = self.rut.tr(".", "").tr("-","").last(4).to_s || 0000
	end

end
