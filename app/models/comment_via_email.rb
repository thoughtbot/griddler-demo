class CommentViaEmail
  def self.process(email)
    new(email).process
  end

  def initialize(email)
    @email = email
  end

  def process
    create_comment
  end

  private
  attr_accessor :email

  def create_comment
    Comment.create(email: email.from, body: sanitized_body)
  end

  def sanitized_body
    Sanitize.clean(email.body, Sanitize::Config::BASIC)
  end
end
