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
require "test_helper"

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
