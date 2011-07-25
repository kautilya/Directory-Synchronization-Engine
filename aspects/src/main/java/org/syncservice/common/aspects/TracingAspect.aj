/*
   Version: MPL 1.1
  
   The contents of this file are subject to the Mozilla Public License Version
   1.1 (the "License"); you may not use this file except in compliance with
   the License. You may obtain a copy of the License at
   http://www.mozilla.org/MPL/
  
   Software distributed under the License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
   for the specific language governing rights and limitations under the
   License.
  
   The Original Code is the Directory Synchronization Engine(DSE).
  
   The Initial Developer of the Original Code is IronKey, Inc.
   Portions created by the Initial Developer are Copyright (C) 2011
   the Initial Developer. All Rights Reserved.
  
   Contributor(s): Shirish Rai
 */
package org.syncservice.common.aspects;

import org.apache.log4j.Logger;
import org.aspectj.lang.Signature;

public aspect TracingAspect {
	private Logger logger = Logger.getLogger(getClass());
	
	pointcut traced() : execution (* *.* (..)) && !within(TracingAspect);
	
	before() : traced() {
		if (logger.isTraceEnabled() == true) {
			Signature sig = thisJoinPointStaticPart.getSignature();
			logger.trace(">>>>>>>> [" + sig.toShortString() + "]");
		}
	}
	
	after() : traced() {
		if (logger.isTraceEnabled() == true) {
			Signature sig = thisJoinPointStaticPart.getSignature();
			logger.trace("<<<<<<<< [" + sig.toShortString() + "]");
		}		
	}
}
