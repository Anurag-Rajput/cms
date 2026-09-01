<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans" 
       	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       	xmlns:p="http://www.springframework.org/schema/p" 
       	xmlns:tx="http://www.springframework.org/schema/tx"
       	xmlns:context="http://www.springframework.org/schema/context"
       	xmlns:jdbc="http://www.springframework.org/schema/jdbc"
       	xmlns:jpa="http://www.springframework.org/schema/data/jpa"
       	xmlns:util="http://www.springframework.org/schema/util"
       	xmlns:aop="http://www.springframework.org/schema/aop"
       	xsi:schemaLocation="
			http://www.springframework.org/schema/beans 
			http://www.springframework.org/schema/beans/spring-beans.xsd
			http://www.springframework.org/schema/tx 
			http://www.springframework.org/schema/tx/spring-tx.xsd
			http://www.springframework.org/schema/context
			http://www.springframework.org/schema/context/spring-context.xsd
			http://www.springframework.org/schema/jdbc 
			http://www.springframework.org/schema/jdbc/spring-jdbc.xsd
			http://www.springframework.org/schema/data/jpa
   			http://www.springframework.org/schema/data/jpa/spring-jpa.xsd
			http://www.springframework.org/schema/util 
			http://www.springframework.org/schema/util/spring-util.xsd
			 http://www.springframework.org/schema/aop
           http://www.springframework.org/schema/aop/spring-aop.xsd">
	   <!-- Activate Spring Data JPA repository support -->
  	
   	


		 <bean id="dataSource"
		  class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName" value="org.postgresql.Driver" />
		
		 <!-- <property name="url" value="jdbc:postgresql://10.247.19.198:5432/postgres" /> -->
		 <property name="url" value="jdbc:postgresql://localhost:5432/cvc" /> 
		  <property name="username" value="postgres" />
		   <property name="password" value="nic" />
		    <!-- <property name="password" value="abc123" /> --> 
		  	 <!--  <property name="password" value="user123" /> -->
		 </bean>
        <tx:annotation-driven  transaction-manager="transactionManager" />
   
	  	<!-- <tx:annotation-driven  transaction-manager="transactionManager" /> -->
	  		  <bean id="persistenceExceptionTranslationPostProcessor"
      class="org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor" /> 
     
    <!-- other transaction infrastructure beans such as a PlatformTransactionManager omitted... -->
     

</beans>
