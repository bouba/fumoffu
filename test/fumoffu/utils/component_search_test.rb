require 'java'

include_class 'javax.swing.JPanel'
include_class 'javax.swing.JLabel'
include_class 'javax.swing.JButton'

require 'component_search'

class FumoffuConfigGeneratorTest < Test::Unit::TestCase
    include Fumoffu::Utils::ComponentSearch
    def my_component
      panel   = JPanel.new
      button  = JButton.new
      panel.setName("RootPanel")

      sub_panel = JPanel.new
      sub_panel.setName "SubPanel"
      label     = JLabel.new
      label.setName "Label"
      button2   = JButton.new
      button2.setName "but2"

      panel.add button
      sub_panel.add label
      sub_panel.add button2
      panel.add sub_panel
      return label
    end
    
    context "Search component" do
      should "find the targeted parent" do
        component = my_component
        component = component_by_name component, "RootPanel"
        assert_not_nil component
        assert component.getName, "RootPanel"
      end
      
      should "failed to find a component" do
        component = my_component
        component = component_by_name component, "RootPanels"
        assert_nil component
      end
      
      should "find the targeted child" do
        component = my_component
        tested_component = component.getParent
        c = component_child_by_name tested_component , "but2"
        assert c.getName, "but2"
      end
      
      should "failed to find the targeted child" do
        component = my_component
        tested_component = component.getParent
        c = component_child_by_name tested_component , "but_not_found"
        assert_nil c
      end
    end
end