require_relative '../src/mail_wrapper'
require_relative '../src/recipe_mail_finder'

describe RecipeMailFinder do
  let(:mail){ MailWrapper.new }

  subject(:finder) do
    RecipeMailFinder.new(mail)
  end

  describe "#all" do
    it "returns all the emails with recipe attachments" do
      expect(finder.all).to have(1).item
    end
  end

  describe "#each" do
    it "yields each email" do
      expect do |b|
        finder.each(&b)
      end.to yield_control.once
    end
  end

  describe "#attachments" do
    it "returns an array of attachments" do
      expect(finder.attachments).to have(1).item
    end
  end
end
