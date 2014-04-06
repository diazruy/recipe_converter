require_relative '../src/mail_wrapper'

describe MailWrapper do

  before :all do
    @mail = MailWrapper.new
  end

  describe "#count" do
    it "returns the number of messages in the inbox" do
      expect(@mail.count).to be > 0
    end
  end

  describe "#logged_in?" do
    it "returns true" do
      expect(@mail).to be_logged_in
    end
  end
end
