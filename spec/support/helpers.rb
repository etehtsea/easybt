module Helpers
  def sign_in(user)
    visit new_user_session_path

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_button 'Sign in'
  end

  RSpec.configure { |c| c.include self, :type => :request }
end
