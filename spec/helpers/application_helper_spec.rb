require "rails/all"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    context "when @product is NOT defined" do
      it "return the default title" do
        stub_const("ApplicationHelper::APP_NAME", "Product Square")
        expect(helper.page_title).to eq("Product Square")
      end
    end
    context "when @product is defined" do
      it "return the title with @product.name" do
        @product = create(:product)
        stub_const("ApplicationHelper::APP_NAME", "Product Square")
        expect(helper.page_title).to eq("Product Square | #{@product.name}")
      end
    end
  end
end
