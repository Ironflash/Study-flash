require 'spec_helper'

describe "reg_cards/show" do
  before(:each) do
    @reg_card = assign(:reg_card, stub_model(RegCard,
      :question => "MyText",
      :answer => "MyText",
      :user_id => 1,
      :group_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
