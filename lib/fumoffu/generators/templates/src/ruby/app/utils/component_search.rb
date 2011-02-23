# To change this template, choose Tools | Templates
# and open the template in the editor.

module ComponentSearch
  def component_by_name component, target
    name = component.getName
    return component unless name.nil? or name != target
    
    if component.getParent then
      component_by_name(component.getParent, target)
    else
      return nil
    end
  end

  def component_child_by_name component, target
    component.getComponents.each do |child_component|
      return child_component unless child_component.getName != target
    end
    return nil
  end
end
