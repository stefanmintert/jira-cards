package com.hoek.jira;

import com.atlassian.crowd.embedded.api.User;
import com.atlassian.jira.plugin.webfragment.contextproviders.AbstractJiraContextProvider;
import com.atlassian.jira.plugin.webfragment.model.JiraHelper;

import java.util.Map;

public class MyContextProvider extends AbstractJiraContextProvider {

  public Map getContextMap(User user, JiraHelper helper) {
    return null;
  }

}
