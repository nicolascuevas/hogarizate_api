class MonthlyIncome < ApplicationRecord

  after_save :recalculate_contact

  belongs_to :contact_form




  def self.get_json_from_floid(contact, json_data)
    
  	json_data.each do |info|
  		monthly_income = contact.monthly_incomes.new
  		monthly_income.main = info[:main].to_i
  		monthly_income.extra = info[:extra].to_i
  		monthly_income.total = info[:main].to_i + info[:extra].to_i
  		monthly_income.date = info[:date].to_date if info[:date].present?
  		monthly_income.year = info[:date].to_date.year if info[:date].present?
  		monthly_income.month = info[:date].to_date.month if info[:date].present?
  		monthly_income.save
  	end

    return true
  end


  def recalculate_contact
  	contact = self.contact_form
  	if contact
  		contact.average_income = contact_form.monthly_incomes.where("date is not null").order(date: :desc).first.total
  		contact.save
  	end
  end

end
