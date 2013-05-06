require 'spec_helper'

describe CommentViaEmail do
  it 'creates a comment' do
    CommentViaEmail.new(nil).process.should be_a Comment
  end
end
