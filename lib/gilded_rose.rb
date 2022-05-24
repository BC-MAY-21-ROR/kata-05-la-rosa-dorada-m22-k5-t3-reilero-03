# frozen_string_literal: true

# Main class
class GildedRose
  #Call Item class and do process
  
  ITEMS = { AB: 'Ages Brie', BPTATC: 'Backstage passes to a TAFKAL80ETC concert',
            SHOR: 'Sulfuras, Hand of Ragnaros', CR: 'Conjured' }.freeze

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if check_if_quality_is_not_eighty(item)
        return "#{ITEMS[:SHOR]} tiene que ser 80 de calidad"
      elsif check_if_quality_is_more_fifty(item)
        return "#{item.name} no tiene que tener mas de 50 de calidad"
      else
        logic(item)
      end
    end
  end

  def logic(item)
    i_name = item.name
    check_type(item)
    item.sell_in -= 1 if i_name != ITEMS[:SHOR]
    check_quality(item)
    "#{i_name}, #{item.sell_in}, #{item.quality}"
  end

  def check_if_quality_is_not_eighty(item)
    item.name == ITEMS[:SHOR] && item.quality != 80
  end

  def check_if_quality_is_more_fifty(item)
    item.name != ITEMS[:SHOR] && item.quality > 50
  end

  

  def check_type(item)
    i_name = item.name
    i_quality = item.quality
    if i_name != ITEMS[:AB] && i_name != ITEMS[:BPTATC]
      name_equal_conjured(item)
    elsif i_quality < 50
      i_quality = i_quality + 1
      name_equal_baskstage(item)
    end
  end

  def name_equal_conjured(item)
    i_name = item.name
    if i_name == ITEMS[:CR]
      item.quality -= 2
    elsif item.quality.positive? && (i_name != ITEMS[:SHOR])
      item.quality -= 1
    end
  end
  
  def name_equal_baskstage(item)
    if item.name == ITEMS[:BPTATC]
      item.quality += 1 if item.sell_in <= 10 && (item.quality < 50)
      item.quality += 1 if item.sell_in <= 5 && (item.quality < 50)
    end
  end

  def check_quality(item)
    i_name = item.name
    item.quality = 0 if item.quality.negative?
    if item.sell_in.negative?
      if i_name != ITEMS[:AB]
        if i_name != ITEMS[:BPTATC]
          item.quality -= 1 if item.quality.positive? && (i_name != ITEMS[:SHOR])
        else
          item.quality -= item.quality
        end
      elsif item.quality < 50
        item.quality += 1
      end
    end
  end
end

# Second class
class Item
  # Class called by GildedRose
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

# item_three = Item.new('Conjured', 5, 10)

# arr_items = [item_three]

# x = GildedRose.new(arr_items)

# puts x.update_quality
# puts x.update_quality
# puts x.update_quality
# puts x.update_quality
