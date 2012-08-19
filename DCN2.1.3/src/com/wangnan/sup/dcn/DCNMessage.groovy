package com.wangnan.sup.dcn

import groovy.json.JsonBuilder
import groovy.sql.Sql

class DCNMessage {
	def pkg = "SUP101"
	def mbo = "Customer"
	def messages
	
	def dbConn() {
		def sql = Sql.newInstance( 'jdbc:sybase:Tds:192.168.246.154:5500?ServiceName=default', 'dba',
			'sql', 'com.sybase.jdbc3.jdbc.SybDriver' )
		sql.eachRow( 'select * from customers' ) { println "$it.id -- ${it.firstName} --" }
	}
	
	def getMessages () {
		
		def ret = []
		def sql = Sql.newInstance( 'jdbc:sybase:Tds:192.168.246.154:5500?ServiceName=default', 'dba',
			'sql', 'com.sybase.jdbc3.jdbc.SybDriver' )
		int i = 0;
		sql.eachRow( 'select * from customer' ) {
			 
			def cols = [id:it.id,name:it.fname]
			def msg = [id:i++, mbo:mbo, cols:cols]
			ret << msg
		}

//		def ret = []
//		for(int i = 0; i < 10; i++) {
//			def cols = [id:1,name:"wangnan"]
//			def msg = [id:i, mbo:mbo, cols:cols]
//			
//			ret << msg
//		}
		sql.close();
		return ret
		
	}
	
	def getDCNRequest () {
		def dcn  = new JsonBuilder();
		dcn {
			pkg pkg
			messages messages
		}
		
		return dcn.toString();
	}
	static main(args) {
		
		
		DCNMessage msg = new DCNMessage();
		println msg.getDCNRequest()
	}

}
