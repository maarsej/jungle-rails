
require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:quantity) }

    @category = Category.find_or_create_by! name: "Test Category"
    test_product = @category.products.create!({
      name: "Product 1",
      description: "Test",
      quantity: 10,
      price: 64.99,
    })

    it "has a name" do
      expect(test_product.name).to eql "Product 1"
    end

    it "has a description" do
      expect(test_product.description).to eql "Test"
    end

    it "has a quantity" do
      expect(test_product.quantity).to eql 10
    end

    it "has a price" do
      expect(test_product.price).to eql 64.99
    end
  end
end
