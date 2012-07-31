require 'spec_helper'

describe "reg_cards/edit" do
  before(:each) do
    @reg_card = assign(:reg_card, stub_model(RegCard,
      :question => "MyText",
      :answer => "MyText",
      :user_id => 1,
      :group_id => 1
    ))
  end

  it "renders the edit reg_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reg_cards_path(@reg_card), :method => "post" do
      assert_select "textarea#reg_card_question", :name => "reg_card[question]"
      assert_select "textarea#reg_card_answer", :name => "reg_card[answer]"
      assert_select "input#reg_card_user_id", :name => "reg_card[user_id]"
      assert_select "input#reg_card_group_id", :name => "reg_card[group_id]"
    end
  end
end
