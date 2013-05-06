require 'spec_helper'

describe CommentViaEmail do
  it 'creates a comment with the correct email and body' do
    comment = CommentViaEmail.new(fake_email).process

    comment.should be_a Comment
    comment.should be_persisted
    comment.email.should eq fake_email.from
    comment.body.should eq fake_email.body
  end

  it 'sanitizes input' do
    Comment.stub(:create) { |*args| OpenStruct.new(*args) }
    malicious_email = fake_email
    malicious_email.body = '<img src="//whatever.com"></img><b>actual content</b>'

    comment = CommentViaEmail.new(malicious_email).process

    comment.body.should eq '<b>actual content</b>'
  end

  def fake_email
    OpenStruct.new(from: 'caleb@thoughtbot.com', body: 'Hey, Caleb!')
  end
end
