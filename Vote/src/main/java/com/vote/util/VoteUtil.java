package com.vote.util;

public class VoteUtil {

	public static String encodingToUTF(String target) throws Exception {
		
		String result = new String(target.getBytes("8859_1"), "UTF-8"); 
		
		return result;
	}
}