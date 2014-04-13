class RecipeMailFinder
  include Enumerable
  attr_accessor :mail

  def initialize(mail)
    @mail = mail
  end

  def all
    @all ||= mail.search(has: :attachment, from: ENV['FROM_EMAIL'], body: "Here is the recipe for")
  end

  def each
    all.each do |email|
      yield email
    end
  end

  def attachments
    collect do |email|
      email.message.attachments[0].body unless email.message.attachments.empty?
    end.compact
  end
end
