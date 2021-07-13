require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { Article.new(title: "About Education", body: "This Asticle about Education", user_id: "1" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a body" do
    subject.body=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a user_id" do
    subject.user_id=nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid if the title less than 2 chars" do
    subject.title="a"
    expect(subject).to_not be_valid
  end
  it "is not valid if the body less than 2 chars" do
    subject.body="a"
    expect(subject).to_not be_valid
  end
   
end
