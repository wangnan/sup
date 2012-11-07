Message with payload
Message format
The message format of the WF-DCN message with payload is:
{¡±id¡±:¡±¡±,¡±op¡±:¡±¡±,¡±subject¡±:¡±¡±,¡±to¡±:¡±¡±,¡±from¡±:¡±¡±,¡±read¡±:¡±¡±,¡±priority¡±:¡±¡±,¡±body¡±:¡±¡±,
¡°data¡±:[{¡±id¡±:¡±¡±,¡±pkg¡±:¡±Package¡±,¡±messages¡±:[{¡±id¡±:¡±2¡±,¡±mbo¡±:¡±MBO¡±,¡±op¡±:¡±:upsert¡±,
¡±cols¡±:{¡±attribute1¡±:¡±value1¡±,¡±attribute2¡±:¡±value2¡±,¡±attribute3¡±:¡±value3¡±}}

The message must contain e-mail information: subject, to, from, and so on, and include the MBO package name and version, MBO name, attribute name, and attribute value. The message can include multiple MBOs. For example:
{
   "id":"1137",
   "op":":upsert",
   "subject":"PERF0111¡¯s Leave Request",
   "to":"PERF0111",
   "from":"Leave Work Flow",
   "read":"false",
   "priority":"true",
   "body":"MATCH:SUP_MWF,TaskID:TS97200149, WIID:1470577, USER:PERF0111*#END#*",
   "data":[
      {
         "id":"dcbtest",
         "pkg":"sup_mwf:1.2",
         "messages":[
            {
               "id":"2",
               "mbo":"Workitem",
               "op":":upsert",
               "cols":{
                  "WORKITEM":"1470577",
                  "USERNAME":"perf0111",
                  "DESCRIPTION":"cc",
                  "DECISION":"test"
               }
            },
            {
               "id":"6",
               "mbo":"Alternatives",
               "op":":upsert",
               "cols":{
                  "WORKITEM":"1470577",
                  "USERNAME":"perf0111",
                  "PKEY":"01",
                  "PVALUE":"Ap"
               }
            }
         ]
      }
   ]
}


http://unwired_server_host:unwired_server_port(default 8000)/dcn/DCNServlet
? cmd=dcn
&username=userName
&password=password
&domain=domainName
&package=unwired_server_PackageName 
&dcn_request={"pkg":"dummy","messages":[{"id":"1","mbo":"CustomerWithParam","op":":upsert","cols":{"id":"10001","fname":"Adam"}}]}
&dcn_filter=fully_qualified_name_of_dcn_filter


