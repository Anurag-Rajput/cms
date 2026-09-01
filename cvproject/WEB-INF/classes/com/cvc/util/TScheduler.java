package com.cvc.util;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;

public final class TScheduler {
	private static final Logger logger = LoggerFactory.getLogger(TScheduler.class);

	@Autowired
	private TaskScheduler scheduler;

	@Autowired
	DataSource dataSource;

	public void init(){
		scheduler.scheduleAtFixedRate(new Runnable() {
			
			
			public void run() {
				// TODO Auto-generated method stub
				logger.info("helloo...");
				System.out.println("hi.....");
			}
		}, 5000);
		
		
	}
	
	
	
	
	
	/*public void init() {
			
		scheduler.scheduleAtFixedRate(new Runnable() {
			public void run() {
				myMethod();
				
			}
		}, new Date(), 1000 * 1); // This will start now and run every
											// two hours
	}

	
	public void myMethod() {
		
		JdbcTemplate jdbcTemplate = null;

		String sql = "CREATE TABLE Persons (PersonID int, LastName varchar(255), FirstName varchar(255),Address varchar(255), City varchar(255) )";

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			jdbcTemplate.execute(sql);
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}

	}*/
	
	//@Scheduled(cron="*/5 * * * * *")
	/*public void doSomething() {
		logger.info("Task Schedluer called");
	}*/

}
