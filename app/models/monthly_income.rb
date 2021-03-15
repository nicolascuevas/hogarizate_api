class MonthlyIncome < ApplicationRecord

  after_save :recalculate_contact

  belongs_to :contact_form, optional: true
  has_one :contact_form, :foreign_key => "last_digits", 
                    :primary_key => "last_digits"




  def self.get_json_from_floid(json_data)
  	sender_last_digits = json_data.first[:sources].first[:sender]
  	json_data.each do |info|

  		monthly_income = MonthlyIncome.new
  		monthly_income.last_digits = sender_last_digits
  		monthly_income.main = info[:main].to_i
  		monthly_income.extra = info[:extra].to_i
  		monthly_income.total = info[:main].to_i + info[:extra].to_i
  		monthly_income.date = info[:date].to_date if info[:date].present?
  		monthly_income.year = info[:date].to_date.year if info[:date].present?
  		monthly_income.month = info[:date].to_date.month if info[:date].present?
  		monthly_income.save!
  	end
  end


  def recalculate_contact
  	contact = self.contact_form
  	if contact
  		contact.average_income = contact_form.monthly_incomes.where("date is not null").order(date: :desc).first.total
  		contact.save
  	end
  end

end
