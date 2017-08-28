class Contact < ActiveRecord::Base
  validates :email, { presence: true }

  def full_name
    "#{first_name} #{last_name}"
  end
end
