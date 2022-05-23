# frozen_string_literal: true

require_relative '../lib/gilded_rose'

describe GildedRose do
  describe 'initialized project' do
    it 'Check method "to_s" in item class' do
      item_1 = Item.new('Conjured', 5, 50)
      x_1 = GildedRose.new(item_1)
      expect(item_1.to_s).to eq('Conjured, 5, 50')
    end

    it 'check_if_quality_is_more_fifty' do
      item_2 = Item.new('Normal', 5, 51)
      x_2 = GildedRose.new(item_2)
      expect(x_2.check_if_quality_is_more_fifty(item_2)).to eq(true)
    end

    it 'check_if_quality_is_not_eighty' do
      item_3 = Item.new('Sulfuras, Hand of Ragnaros', 5, 80)
      x_3 = GildedRose.new(item_3)
      expect(x_3.check_if_quality_is_not_eighty(item_3)).to eq(false)
    end
  end

  describe 'update_quality' do
    it 'check update_quality method fot BPTATC test 1' do
      item_4 = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 40)
      x_4 = GildedRose.new([item_4])
      expect(x_4.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, 10, 41')
    end
    it 'check update_quality method fot BPTATC test 2' do
      item_5 = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 40)
      x_5 = GildedRose.new([item_5])
      expect(x_5.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, 9, 42')
    end
    it 'check update_quality method fot BPTATC test 3' do
      item_6 = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 40)
      x_6 = GildedRose.new([item_6])
      expect(x_6.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, 4, 43')
    end
    it 'check update_quality method fot BPTATC test 4' do
      item_7 = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 40)
      x_7 = GildedRose.new([item_7])
      expect(x_7.update_quality).to eq('Backstage passes to a TAFKAL80ETC concert, -1, 0')
    end
    it 'check update_quality method for AB' do
      item_8 = Item.new('Ages Brie', 0, 49)
      x_8 = GildedRose.new([item_8])
      expect(x_8.update_quality).to eq('Ages Brie, -1, 50')
    end
    it 'check update_quality method for SHOR' do
      item_9 = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
      x_9 = GildedRose.new([item_9])
      expect(x_9.update_quality).to eq('Sulfuras, Hand of Ragnaros, 0, 80')
    end
    it 'check update_quality method for CR' do
      item_10 = Item.new('Conjured', 10, 50)
      x_10 = GildedRose.new([item_10])
      expect(x_10.update_quality).to eq('Conjured, 9, 48')
    end
    it 'check update_quality method for Normal ' do
      item_11 = Item.new('Normal', 10, 50)
      x_11 = GildedRose.new([item_11])
      expect(x_11.update_quality).to eq('Normal, 9, 49')
    end
  end
end
