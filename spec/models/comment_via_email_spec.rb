require 'spec_helper'

describe CommentViaEmail do
  it 'creates a comment with the correct email and body' do
    comment = CommentViaEmail.new(fake_email).process

    comment.should be_a Comment
    comment.should be_persisted
    comment.email.should eq fake_email.from
    comment.body.should eq fake_email.html_body
  end

  def fake_email
    OpenStruct.new(from: 'caleb@thoughtbot.com', html_body: 'Hey, Caleb!')
  end
end
