# == Schema Information
#
# Table name: contacts
#
#  id          :bigint           not null, primary key
#  address     :string
#  email       :string
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Contact < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_term,
    against: [ :first_name, :middle_name, :last_name, :phone, :email ],
    using: {
      tsearch: { prefix: true }
    }

  # Validations
  validates :first_name, presence: true, length: { maximum: 100 }
  validates :middle_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, length: { maximum: 255 }
end
