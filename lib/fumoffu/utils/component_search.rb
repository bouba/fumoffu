module Fumoffu
  
=begin rdoc
  Regroup useful tools used in the Fumoffu framework
=end
  module Utils
    
    # This module is used to enable to find easily Java Swing Component based on their name
    module ComponentSearch

      # Find the parent of the given component that has the same exact name
      def component_by_name component, target
        name = component.getName
        return component unless name.nil? or name != target
        return component.getParent ? component_by_name(component.getParent, target) : nil
      end

      # Find the direct child of the component that has the same exact name
      def component_child_by_name component, target
        component.getComponents.each do |child_component|
          return child_component unless child_component.getName != target
        end
        return nil
      end
    end
  end
end
