# frozen_string_literal: true

require_relative '../lib/gilded_rose'

describe GildedRose do
  describe 'initialized project' do
    it 'Check method "to_s" in item class' do
      item = Item.new('Conjured', 5, 50)
      x = GildedRose.new(item)
      expect(item.to_s).to eq('Conjured, 5, 50')
    end

    it 'check_if_quality_is_more_fifty' do
      item = Item.new('Normal', 5, 51)
      x = GildedRose.new(item)
      expect(x.check_if_quality_is_more_fifty(item)).to eq(true)
    end

    it 'check_if_quality_is_not_eighty' do
      item = Item.new('Sulfuras, Hand of Ragnaros', 5, 80)
      x = GildedRose.new(item)
      expect(x.check_if_quality_is_not_eighty(item)).to eq(false)
    end
  end

  describe 'update_quality' do
    it 'check update_quality method fot BPTATC test 1' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, 10, 41')
    end
    it 'check update_quality method fot BPTATC test 2' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 40)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, 9, 42')
    end
    it 'check update_quality method fot BPTATC test 3' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 40)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, 4, 43')
    end
    it 'check update_quality method fot BPTATC test 4' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 40)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, -1, 0')
    end
    it 'check update_quality method for AB' do
      item = Item.new('Ages Brie', 0, 49)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Ages Brie, -1, 50')
    end
    it 'check update_quality method for SHOR' do
      item = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Sulfuras, Hand of Ragnaros, 0, 80')
    end
    it 'check update_quality method for CR' do
      item = Item.new('Conjured', 10, 50)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Conjured, 9, 48')
    end
    it 'check update_quality method for Normal ' do
      item = Item.new('Normal', 10, 50)
      x = GildedRose.new([item])
      expect(x.update_quality).to eq('Normal, 9, 49')
    end
  end
end
