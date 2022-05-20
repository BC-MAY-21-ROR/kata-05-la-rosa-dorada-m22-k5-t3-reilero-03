# frozen_string_literal: true

class GildedRose
  def initialize(items)
    @items = items
  end

  ITEMS = { N: 'Normal', AB: 'Ages Brie', BPTATC: 'Backstage passes to a TAFKAL80ETC concert',
            SHOR: 'Sulfuras, Hand of Ragnaros', C: 'Conjured' }.freeze

  def update_quality
    @items.each do |x|
      check_type(x)
      x.sell_in -= 1 if x.name != [:SHOR]
      check_quality(x)
    end
  end

  def check_type(item)
    if item.name != ITEMS[:AB] && item.name != ITEMS[:BPTATC]
      item.quality -= 1 if item.quality.positive? && (item.name != ITEMS[:SHOR])
    elsif item.quality < 50
      item.quality = item.quality + 1
      if item.name == ITEMS[:BPTATC]
        item.quality += 1 if item.sell_in <= 10 && (item.quality < 50)
        item.quality += 1 if item.sell_in <= 5 && (item.quality < 50)
      end
    end
  end

  def check_quality(item)
    if item.sell_in.negative?
      if item.name != ITEMS[:AB]
        if item.name != ITEMS[:BPTATC]
          item.quality -= 1 if item.quality.positive? && (item.name != ITEMS[:SHOR])
        else
          item.quality -= item.quality
        end
      elsif item.quality < 50
        item.quality += 1
      end
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

i1 = Item.new('Normal', 0, 50)
i2 = Item.new('Ages Brie', 2, 40)
i3 = Item.new('Sulfuras, Hand of Ragnaros', 0, 50)
i4 = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)
i5 = Item.new('Conjured', 0, 50)

list_i = [i1, i2, i3, i4, i5]

x = GildedRose.new(list_i)
puts x.update_quality
puts x.update_quality
