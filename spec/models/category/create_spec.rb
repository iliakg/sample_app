describe Category, '.create' do
  let!(:cat1) { create :category }
  let!(:cat2) { create :category }
  let!(:cat21) { create :category, parent_id: cat2.id }
  let!(:cat22) { create :category, parent_id: cat2.id }
  let!(:cat221) { create :category, parent_id: cat22.id }
  let!(:cat3) { create :category }

  context 'create category without limit on subcategry' do
    it { expect(Category.create(title: 'test', parent_id: cat2.id).errors.messages).to be_empty }
    it { expect(Category.create(title: 'test', parent_id: cat22.id).errors.messages).to be_empty }
  end

  context 'create sub category when limit on subcategry' do
    it { expect(Category.create(title: 'test', parent_id: cat221.id).errors.messages).not_to be_empty }
  end
end
