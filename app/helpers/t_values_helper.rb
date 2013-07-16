module TValuesHelper
  class Trans
    def self.to_items items
      tmp = ""
      items.each_value { |v| tmp += v.strip+"</?>" }
      tmp.strip
    end
  end
end
