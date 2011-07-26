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
  
   The Initial Developer of the Original Code is Shirish Rai.
   Portions created by the Initial Developer are Copyright (C) 2011
   the Initial Developer. All Rights Reserved.
  
   Contributor(s):
 */
package org.syncservice.common.aspects.test;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.syncservice.common.aspects.Profile;

public class ProfilingAspectTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Profile
	@Test
	public void one() {
		for (int i = 0; i < 200; ++i);
	}

	@Profile
	@Test(expected=Exception.class)
	public void two() throws Exception {
		for (int i = 0; i < 2000; ++i);
		throw new Exception();
	}
}
