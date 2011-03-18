package org.github.bouba.fumoffu;

/**
 *  This class is the Link between the Java Swing interface and the JRuby sources
 *  All action that require processing on the swing interface should go through this class
 *
 * @author bouba
 */
abstract public class ActionManager {
    abstract public void handleAction(java.awt.event.ActionEvent event, UIActions action, java.awt.Component outputContainer);
}
