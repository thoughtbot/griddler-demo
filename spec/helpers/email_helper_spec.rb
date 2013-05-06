require 'spec_helper'

describe EmailHelper, 'partial_email' do
  it 'obfuscates the email address' do
    obfuscated = helper.partial_email('ralph@example.com')

    obfuscated.should eq 'ra[...]@example.com'
  end
end
