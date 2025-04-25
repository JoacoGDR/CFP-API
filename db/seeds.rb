# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')

  BusinessGroup.create!(name: 'Grupo 1')
  BusinessGroup.create!(name: 'Grupo 2')
  BusinessGroup.create!(name: 'Grupo 3')

  Company.create!(name: 'Empresa 1', business_group: BusinessGroup.first)
  Company.create!(name: 'Empresa 2', business_group: BusinessGroup.second)
  Company.create!(name: 'Empresa 3', business_group: BusinessGroup.third)
  Company.create!(name: 'Empresa 4', business_group: nil)

  vessels_1 = FactoryBot.create_list(:vessel, 6, company: Company.first)
  vessels_2 = FactoryBot.create_list(:vessel, 6, company: Company.second)
  vessels_3 = FactoryBot.create_list(:vessel, 5, company: Company.third)
  vessels_4 = FactoryBot.create_list(:vessel, 4, company: Company.fourth)

  Species.create!(name: 'Merluza Negra')
  Species.create!(name: 'Merluza Común')
  Species.create!(name: 'Merluza de Cola')
  Species.create!(name: 'Polaca')
  Species.create!(name: 'Langostino')

  CatchQuota.create!(quota: 10, owner: vessels_1.sample, owner_type: 'Vessel', species: Species.first, start_date: Date.today)
  CatchQuota.create!(quota: 15, owner: vessels_2.sample, owner_type: 'Vessel', species: Species.first, start_date: Date.today)
  CatchQuota.create!(quota: 10, owner: vessels_3.sample, owner_type: 'Vessel', species: Species.first, start_date: Date.today)
  CatchQuota.create!(quota: 65, owner: vessels_4.sample, owner_type: 'Vessel', species: Species.first, start_date: Date.today)
end
