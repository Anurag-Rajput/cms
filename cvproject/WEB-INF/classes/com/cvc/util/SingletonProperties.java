package com.cvc.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SingletonProperties implements Cloneable{
	
	private static Properties uploadclearanceProperties = null;
	
	private SingletonProperties()
	{
	}
	
	public static synchronized Properties getUploadclearanceProperty() {		
		try {
			if(null == uploadclearanceProperties)
			{
				InputStream is =  SingletonProperties.class.getClassLoader().getResourceAsStream("uploadclearance.properties");
				uploadclearanceProperties = new Properties();
				uploadclearanceProperties.load(is);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return uploadclearanceProperties;
	}
	
	
	public Object clone() throws CloneNotSupportedException{
	     throw new CloneNotSupportedException();  
	     
	}
	
	
private static Properties uploadcomplainProperties = null;
	
	public static synchronized Properties getUploadcomplainProperty() {		
		try {
			if(null == uploadcomplainProperties)
			{
				InputStream is =  SingletonProperties.class.getClassLoader().getResourceAsStream("uploadcomplain.properties");
				uploadcomplainProperties = new Properties();
				uploadcomplainProperties.load(is);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return uploadcomplainProperties;
	}

	private static Properties uploadCvoProperties = null;
	
	public static synchronized Properties getUploadcvoProperty() {
		
		try {
			if(null == uploadCvoProperties)
			{
				InputStream is =  SingletonProperties.class.getClassLoader().getResourceAsStream("uploadcvo.properties");
				uploadCvoProperties = new Properties();
				uploadCvoProperties.load(is);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return uploadCvoProperties;
	}
	
	
	private static Properties uploadCitizenProperties = null;
	
	public static synchronized Properties getUploadcitizenProperty() {
		
		try {
			if(null == uploadCitizenProperties)
			{
				InputStream is =  SingletonProperties.class.getClassLoader().getResourceAsStream("uploadcitizen.properties");
				uploadCitizenProperties = new Properties();
				uploadCitizenProperties.load(is);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return uploadCitizenProperties;
	}
	
	
	
}
