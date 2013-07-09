module TheadersHelper
  class MyExcel
    
    def self.items_to_s items
      items = items.split
      tmp = "";
      items.each do |t|
        tmp += t
      end
      return items.length
    end
 
    # get the length of items
    def self.items_length items
      return (items.split).length
    end
  end
end
