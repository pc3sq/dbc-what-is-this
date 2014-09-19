require 'rails_helper'

RSpec.describe User do
  it "fails if name is less than 2 alphanumerics" do
    user = User.new(name: 'a')
    user.valid?

    expect(user.errors).to  be_added :name
  end

  it "ensures name is at least 2 alphanumerics" do
    user = User.new(name: 'Al')
    user.valid?

    expect(user.errors).to_not  be_added :name
  end

end
