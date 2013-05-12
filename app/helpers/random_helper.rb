# -*- coding: utf-8 -*-
# 随机数辅助类
module RandomHelper
  class MyRandom
    # number and char
    def self.long_random_number_and_char length=16
      res = ""
      i=0
      tmp=0
      while true
        tmp = rand(0..122)
        if (0..9).include?tmp
          res += tmp.to_s
        else
          if (65..90).include?tmp
            res += tmp.chr
          else
            if (97..122).include?tmp
              res += tmp.chr
            else
              next
            end
          end
        end
        i += 1
        if i == length
          break
        end
      end
      res
    end
    # number
    def self.long_random_number length=16
      res = ""
      tmp = 0;
      while tmp<length 
        res += rand(0..9).to_s
      end
      res
    end
    # char only
    def self.long_random_char length = 16
      @length = length
    end
  end
end
