package {

import flash.display.Sprite;
import org.flexunit.internals.TraceListener;
import org.flexunit.runner.FlexUnitCore;
import org.flexunit.listeners.CIListener;
<% fullyQualifiedNames.each { %>
import $it;
<% } %>

public class FlexUnitRunner extends Sprite {

        private var core:FlexUnitCore;

        public function FlexUnitRunner()
        {
            core = new FlexUnitCore();
            core.addListener(new CIListener());
            core.addListener(new TraceListener());
            core.run(currentRunTestSuite());
        }

        public function currentRunTestSuite():Array {
            var testsToRun:Array = new Array();
            <% testClasses.each { %>
            testsToRun.push($it);
            <% } %>
            return testsToRun;
        }

}
}
