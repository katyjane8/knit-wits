describe "Visitor views their cart" do
    before(:each) do
      @item = create(:item)
    end

    it "visitor can see the quantity of items in cart" do
      visit items_path

        click_button "Add to Cart"

        click_link "Cart"
        expect(page).to have_selector("input[value='1']")

    end

    it "visitor can change the quantity of items in a cart " do
      visit items_path

      click_button "Add to Cart"


      click_link "Cart"


      fill_in "quantity", with: 4

      click_on "Save changes"

      expect(page).to have_content("You now have 4 cool mittens in your cart!")
    end
    # it "visitor can add an amount to their cart" do
    #   visit items_path
    #
    #   click_button "Add to Cart"
    #
    #   click_link "Cart"
    #
    #   click_button 'Add one'
    #
    #   expect(page).to have_content("You now have 0 cool mittens in your cart!")
    # end
end
