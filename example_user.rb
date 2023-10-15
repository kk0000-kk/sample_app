class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @first_name = attributes[:first_name]
    @family_name = attributes[:family_name]
    @email = attributes[:email]
  end

  def full_name
    "#{@first_name} #{@family_name}"
  end

  def alphabetical_name
    "#{@family_name}, #{@first_name}"
  end

  def formatted_email
    "#{full_name} <#{@email}>"
  end
end