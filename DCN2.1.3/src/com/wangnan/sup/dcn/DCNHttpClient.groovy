package com.wangnan.sup.dcn
import groovyx.net.http.*
import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*
class DCNHttpClient {
	def url = 'http://www.sina.com.cn'

	def sendRequest() {
		def http = new HTTPBuilder( 'http://www.sina.com.cn' )
		
		// perform a GET request, expecting JSON response data
		http.request( GET, TEXT ) {
		  uri.path = '/'
//		  uri.query = []
		
		  headers.'User-Agent' = 'Mozilla/5.0 Ubuntu/8.10 Firefox/3.0.4'
		
		  // response handler for a success response code:
		  response.success = { resp, json ->
			println resp.statusLine
		
			// parse the JSON response object:
			System.out << json
		  }
		
		  // handler for any failure status code:
		  response.failure = { resp ->
			println "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
		  }
		}
	}
	
	static main(args) {
		DCNHttpClient c = new DCNHttpClient();
		c.sendRequest();
	}
}
