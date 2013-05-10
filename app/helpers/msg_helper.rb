#the module of Json
module MsgHelper
  # Json Msg
  class JMsg
    #= attr
    #== code
    #=== 0=>ok 1=>error
    #== msg
    #=== msg to be send
    #== html
    #=== html code
    attr_accessor :code,:msg,:html
    def initialize code=0,msg="",html=""
      @code = code
      @msg = msg
      @html = html
    end
  end
end
