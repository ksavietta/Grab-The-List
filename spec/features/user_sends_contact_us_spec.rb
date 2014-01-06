require 'spec_helper'

feature 'contact us form/mailer', %Q{As a site visitor
I want to contact the site's staff
So that I can ask questions or make comments about the site} do

# Acceptance Criteria:

# I must specify a valid email address
# I must specify a subject
# I must specify a description
# I must specify a first name
# I must specify a last name

  scenario 'specifies contact information, sends form' do
    ActionMailer::Base.deliveries = []

    expect(ActionMailer::Base.deliveries.size).to eq(1)
    last_email = ActionMailer::Base.deliveries.last


end