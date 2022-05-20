# frozen_string_literal: true

class GildedRose
  ITEMS = { AB: 'Ages Brie', BPTATC: 'Backstage passes to a TAFKAL80ETC concert',
            SHOR: 'Sulfuras, Hand of Ragnaros' }.freeze

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == ITEMS[:AB]
        item.quality = item.quality + 1
      end
      if different_to_item_name(item, ITEMS[:AB]) && different_to_item_name(item, ITEMS[:BPTATC])
        item.quality = item.quality - 1 if item.quality.positive? && (item.name != ITEMS[:SHOR])
      elsif item.quality < 50
        if item.name == ITEMS[:BPTATC]
          item.quality = item.quality + 1 if item.sell_in < 11 && (item.quality < 50)
          item.quality = item.quality + 1 if item.sell_in < 6 && (item.quality < 50)
        end
        item.quality = item.quality + 1
      end
      item.sell_in = item.sell_in - 1 if item.name != ITEMS[:SHOR]
      if_sell_in_is_negative(item)
    end

  end

  def different_to_item_name(item, name)
    item.name != name
  end
  
  def if_sell_in_is_negative(item)
    different_name_aged_brie(item)
  end

  def different_name_aged_brie(item)
    if item.name != 'Aged Brie'
      if item.name != 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.quality - 1 if item.quality.positive? && (item.name != 'Sulfuras, Hand of Ragnaros')
      else
        item.quality = item.quality - item.quality
      end
    elsif item.quality < 50
      item.quality = item.quality + 1
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

item_three = Item.new('Ages Brie', 5, 8)

arr_items = [item_three]

x = GildedRose.new(arr_items)
puts x.update_quality
puts x.update_quality
puts x.update_quality
puts x.update_quality
puts x.update_quality
puts x.update_quality

puts x.update_quality

puts x.update_quality
