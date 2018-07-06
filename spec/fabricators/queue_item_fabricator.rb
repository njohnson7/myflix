# spec/fabricators/queue_item_fabricator.rb

Fabricator :queue_item do
  position { [1, 2, 3].sample }
end
