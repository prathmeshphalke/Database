/*"""
Author: Prathmesh Phalke
Version: 2.4
Created on: 04/22/2019
Last Updated: 05/25/2019
Description: Table that stores the result of table comparison done by DBcompare scripts. 
"""*/
  CREATE TABLE "OBIEE_OWNER"."COMPARE_RESULTS" 
   (	"RUN_DATE" DATE, 
	"TABLE_NAME" VARCHAR2(1000 BYTE), 
	"RESULTS" VARCHAR2(100 BYTE), 
	"DATADIFFROWS" VARCHAR2(100 BYTE), 
	"COUNTDIFF" NUMBER(*,0), 
	"OLD_OBIEE_CNT" NUMBER(*,0), 
	"NEW_OBIEE_CNT" NUMBER(*,0), 
	"SQL_QUERY" VARCHAR2(4000 BYTE)
   ) 
