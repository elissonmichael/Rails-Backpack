class Item < ApplicationRecord
  def to_s
    "#{name} (size: #{size} weight: #{weight})"    
  end
end
