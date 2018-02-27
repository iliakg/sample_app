describe Category, '.parents' do
  let!(:cat1) { create :category }
  let!(:cat2) { create :category }
  let!(:cat21) { create :category, parent_id: cat2.id }
  let!(:cat22) { create :category, parent_id: cat2.id }
  let!(:cat221) { create :category, parent_id: cat22.id }
  let!(:cat2211) { create :category, parent_id: cat221.id }
  let!(:cat3) { create :category }

  context 'category with parents' do
    it 'should return array' do
      expect(cat2211.parents.map(&:id)).to eq([cat221.id, cat22.id, cat2.id])
    end
  end
end
