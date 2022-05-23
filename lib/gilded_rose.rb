# frozen_string_literal: true

class GildedRose
  ITEMS = { AB: 'Ages Brie', BPTATC: 'Backstage passes to a TAFKAL80ETC concert',
            SHOR: 'Sulfuras, Hand of Ragnaros', CR: 'Conjured' }.freeze

  def initialize(items)
    @items = items
  end

  def update_quality

    @items.each do |x|
      if check_if_quality_is_eighty(x)
        return puts "#{x.name} no tiene que tener mas o menos de 80 de calidad"
      elsif check_if_quality_is_more_fifty(x)
        return puts "#{x.name} no tiene que tener mas de 50 de calidad"
      else
        check_type(x)
        x.sell_in -= 1 if x.name != ITEMS[:SHOR]
        check_quality(x)
      end
    end
  end

  def check_if_quality_is_more_fifty(item)
    item.name != ITEMS[:SHOR] && item.quality > 50
  end

  def check_if_quality_is_eighty(item)
    item.name == ITEMS[:SHOR] && item.quality != 80
  end

  def check_type(item)
    if item.name != ITEMS[:AB] && item.name != ITEMS[:BPTATC]
      if item.name == ITEMS[:CR]
        item.quality -= 2
      else
        item.quality -= 1 if item.quality.positive? && (item.name != ITEMS[:SHOR])
      end
    elsif item.quality < 50
      item.quality = item.quality + 1
      if item.name == ITEMS[:BPTATC]
        item.quality += 1 if item.sell_in <= 10 && (item.quality < 50)
        item.quality += 1 if item.sell_in <= 5 && (item.quality < 50)
      end
    end
  end

  def check_quality(item)
    if item.quality.negative?
      item.quality = 0
    end
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

item_three = Item.new('Conjured', 5, 10)

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
