# ####################################
# CUSTOM CLASSES
# ####################################

#
# Object and Classes are overidden to make it easier for to
# exchange data between the Java accessor and Ruby accessor
#

class Object
  module InstanceExecHelper; end
  include InstanceExecHelper
  def instance_exec(*args, &block)
    begin
      old_critical, Thread.critical = Thread.critical, true
      n = 0
      n += 1 while respond_to?(mname="__instance_exec#{n}")
      InstanceExecHelper.module_eval{ define_method(mname, &block) }
    ensure
      Thread.critical = old_critical
    end
    begin
      ret = send(mname, *args)
    ensure
      InstanceExecHelper.module_eval{ remove_method(mname) } rescue nil
    end
    ret
  end

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

class Class
  def def_each(*method_names, &block)
    method_names.each do |method_name|
      define_method method_name do
        instance_exec method_name, &block
      end
    end
  end
end