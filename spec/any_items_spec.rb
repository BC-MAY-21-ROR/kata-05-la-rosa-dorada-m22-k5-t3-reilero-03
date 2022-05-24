# frozen_string_literal: true

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do
  describe 'update_quality any items' do
    it 'check update_quality method for AB' do
      item = Item.new('Ages Brie', 0, 49)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Ages Brie, -1, 50')
    end
    it 'check update_quality method for SHOR' do
      item = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Sulfuras, Hand of Ragnaros, 0, 80')
    end
    it 'check update_quality method for CR' do
      item = Item.new('Conjured', 10, 50)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Conjured, 9, 48')
    end
    it 'check update_quality method for Normal ' do
      item = Item.new('Normal', 10, 50)
      gilded_rose = GildedRose.new([item])
      expect(gilded_rose.update_quality[0].to_s).to eq('Normal, 9, 49')
    end
  end
end