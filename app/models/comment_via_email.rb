class CommentViaEmail
  def initialize(email)
    @email = email
  end

  def process
    Comment.new
  end
end
