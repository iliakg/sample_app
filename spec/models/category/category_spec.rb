describe Category, '.test' do
  let!(:category) { create :category, title: 'blablabla' }

  context "test category" do
    it{ expect(category.title).to eq('blablabla') }
  end
end
