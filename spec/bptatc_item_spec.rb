
require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do
  describe 'update_quality for BPTATC' do
    it 'check update_quality method fot BPTATC test 1' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Backstage passes to a TAFKAL80ETC concert, 10, 41')
    end

    it 'check update_quality method fot BPTATC test 2' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 40)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Backstage passes to a TAFKAL80ETC concert, 9, 42')
    end

    it 'check update_quality method fot BPTATC test 3' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 40)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Backstage passes to a TAFKAL80ETC concert, 4, 43')
    end
    it 'check update_quality method fot BPTATC test 4' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 40)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Backstage passes to a TAFKAL80ETC concert, -1, 0')
    end
  end
end