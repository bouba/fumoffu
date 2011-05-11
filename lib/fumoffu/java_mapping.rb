#
# Object is overidden to make it easier for to
# exchange data between the Java accessor and Ruby accessor
# We base the accessor method on the Ruby and Java standard
#
# ex: You need to use same object on the Java and Ruby layers
# in order to access the object attribute the Ruby way.
#
# ex:
#   // Class in Java
#   public class Post {
#     private String content;
#     public String getContent(){return this.content;}
#     public void setContent(final String content){this.content = content;}
#   }
# 
#   // Class in Ruby
#   class Post
#     attr_java :content
#   end
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
