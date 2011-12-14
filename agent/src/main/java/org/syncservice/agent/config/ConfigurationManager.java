package org.syncservice.agent.config;

import org.springframework.jmx.export.annotation.ManagedOperation;
import org.springframework.jmx.export.annotation.ManagedResource;

@ManagedResource
public class ConfigurationManager {

  @ManagedOperation
  public void saveConfiguration() {
    
  }

}
