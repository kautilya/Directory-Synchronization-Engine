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
  
   The Initial Developer of the Original Code is Shirish Rai
   Portions created by the Initial Developer are Copyright (C) 2011
   the Initial Developer. All Rights Reserved.
  
   Contributor(s): 
 */
package org.syncservice.common.aspects;

import org.apache.log4j.Logger;
import org.aspectj.lang.Signature;

public aspect ProfilingAspect {
	private Logger logger = Logger.getLogger(getClass());
	
	pointcut profiled() : execution (@Profile * *.* (..)) && !within(ProfilingAspect);

	Object around() : profiled() {
		if (logger.isInfoEnabled() == false)
			return proceed();
		long start = System.nanoTime();
		try {
			return proceed();
		} finally {
			long end = System.nanoTime();
			Signature sig = thisJoinPointStaticPart.getSignature();
			logger.info("PROFILE: [" + sig.toShortString() + "] : " + (end - start));
		}
	}
}
