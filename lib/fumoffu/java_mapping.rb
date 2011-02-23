# ####################################
# CUSTOM CLASSES
# ####################################

#
# Object and Classes are overidden to make it easier for to
# exchange data between the Java accessor and Ruby accessor
#

class Object
  def self.attr_java(*args)
    args.each do |arg|
      str_arg = arg.to_s
      define_method str_arg do
        send "get"+str_arg.split("_").collect(){|n| n.capitalize}.to_s
      end
      define_method str_arg.to_s+"=" do |val|
        send "set"+str_arg.split("_").collect(){|n| n.capitalize}.to_s, val
      end
    end
  end
end
