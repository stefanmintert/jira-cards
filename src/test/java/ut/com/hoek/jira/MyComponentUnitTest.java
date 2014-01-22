package ut.com.hoek.jira;

import org.junit.Test;
import com.hoek.jira.MyPluginComponent;
import com.hoek.jira.MyPluginComponentImpl;

import static org.junit.Assert.assertEquals;

public class MyComponentUnitTest {
  @Test
  public void testMyName() {
    MyPluginComponent component = new MyPluginComponentImpl(null);
    assertEquals("names do not match!", "myComponent", component.getName());
  }
}