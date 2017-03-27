package org.exfly.models;

import java.util.UUID;

public class DBStaticTools {
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}
}
