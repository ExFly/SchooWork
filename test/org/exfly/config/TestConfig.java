package org.exfly.config;


import static org.junit.Assert.*;

import org.exfly.config.Config;
import org.junit.Before;
import org.junit.Test;

public class TestConfig {

	Config configer = null;

	@Before
	public void setUp() throws Exception {
		configer = Config.getConfiger();
	}

	@Test
	public void testNewOneInstance() {
		assertSame(configer, Config.getConfiger());
	}

	@Test
	public void testGetOneItemFromConfigFile() {
		assertEquals("movieshare", configer.getItem("database.name"));
	}
}
