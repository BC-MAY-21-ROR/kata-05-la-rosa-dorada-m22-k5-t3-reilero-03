# frozen_string_literal: true

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do
  describe 'initialized project' do

    it 'check_if_quality_is_more_fifty' do
      item = Item.new('Normal', 5, 51)
      gilded_rose = GildedRose.new(item)
      expect(gilded_rose.check_if_quality_is_more_fifty(item)).to eq(true)
    end

    it 'check_if_quality_is_not_eighty' do
      item = Item.new('Sulfuras, Hand of Ragnaros', 5, 80)
      gilded_rose = GildedRose.new(item)
      expect(gilded_rose.check_if_quality_is_not_eighty(item)).to eq(false)
    end
  end
end
