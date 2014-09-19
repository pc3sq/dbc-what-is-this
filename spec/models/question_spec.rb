require 'rails_helper'

RSpec.describe Question do
  it "slug should be auto-generated" do
    question = Question.new(title: "A great story?", image_path: "http://stefansucks.com/daniel_rocks.jpg")

    expect { question.save! }.to change { question.slug }.from(nil).to("a-great-story")
  end

end
