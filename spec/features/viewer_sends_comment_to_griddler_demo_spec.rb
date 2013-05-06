require 'spec_helper'

feature 'Viewer sends comment to Griddler Demo' do
  scenario 'it shows up on the home page' do
    message = 'Joel was here'

    page.driver.post email_processor_path, fake_sendgrid_params(message)
    visit root_path

    page.should have_content(message)
  end

  scenario 'hides the user email' do
    page.driver.post email_processor_path, fake_sendgrid_params('message')
    visit root_path

    page.should_not have_content 'joel@thoughtbot.com'
  end

  def fake_sendgrid_params(message)
    {
      to: 'Griddler Demo <griddler-demo@example.com>',
      from: 'Joel Oliveira <joel@thoughtbot.com>',
      text: message,
    }
  end
end
