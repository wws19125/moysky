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
      # @length = length
    end

    # user id like qq
    #* 连号不超过3，连续相同数组不超过4个
    #** start_name
    #*** 开始数字
    def self.get_rand_qq start_number
      while !(vertify_qq_number(start_number.to_s) && vertify_qq_number(start_number.to_s.reverse) && vertify_qq_number_num(start_number.to_s))
        start_number += 1;
      end
      start_number
    end
    
    # 私有方法，辅助
    private
    
    # 验证数字是否符合符合条件
    #* number_s 验证的数字
    #* index 验证开始位置
    def self.vertify_qq_number number_s, index = 0
      if number_s[index+2]
        c = number_s[index].ord
        n = number_s[index+1].ord
        nn = number_s[index+2].ord
        # nnn = number_s[index+3]? number_s[index+3].ord : -1
        return (c == (n-1) && c == (nn-2)) || ((c == n)&&(c == nn)) || ((c==n)&&c==48) ? false : vertify_qq_number(number_s,(index+1))
      else
        return true;
      end
    end

    def self.vertify_qq_number_num number_s
      num = 0
      10.times { |i| (num += 1) if number_s.include? i.to_s }
      return num >= number_s.length/2+1
    end

  end
end
