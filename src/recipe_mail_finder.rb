class RecipeMailFinder
  include Enumerable
  attr_accessor :mail

  def initialize(mail)
    @mail = mail
  end

  def all
    mail.search(has: :attachment, from: ENV['FROM_EMAIL'], body: "Here is the recipe for")
  end

  def each
    all.each do |email|
      yield email
    end
  end

  def attachments
    collect do |email|
      email.message.attachments[0].body
    end
  end
end
