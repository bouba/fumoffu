require 'java'

include_class 'javax.swing.JPanel'
include_class 'javax.swing.JLabel'
include_class 'javax.swing.JButton'

require 'component_search'

class FumoffuConfigGeneratorTest < Test::Unit::TestCase
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
        component.should_not be_nil
        component.getName.should == "RootPanel"
      end
      
      should "failed to find a component" do
        component = my_component
        component = component_by_name component, "RootPanels"
        component.should be_nil
      end
      
      should "find the targeted child" do
        component = my_component
        tested_component = component.getParent
        c = component_child_by_name tested_component , "but2"
        c.getName.should == "but2"
      end
    end
end