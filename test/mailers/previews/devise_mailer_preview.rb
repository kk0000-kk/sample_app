class DevisePreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/devise/confirmation_instructions.html
  def confirmation_instructions
    Devise::Mailer.confirmation_instructions(User.first, Devise.friendly_token[0, 20])
  end
end
