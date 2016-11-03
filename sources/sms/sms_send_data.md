通过以下接口可以对短信发送数据进行查询.
- - - 
##发送数据统计（每天）
返回根据TemplateId和msgType进行分组的按天统计的短信数据
    
**URL**    
```
http://www.sendcloud.net/smsapi/data/sendDay
```
    
**HTTP请求方式**
```
post    get
```
  
**参数说明** 
    
|参数|类型|必须|说明|
|:---|:---|:---|:---|
|smsUser|string|是|smsUser|
|days|string|*|过去 days 天内的统计数据 (`days=1`表示今天)| 
|startDate|string|*|开始日期, 格式为`yyyy-MM-dd`|
|endDate|string|*|结束日期, 格式为`yyyy-MM-dd`|
|msgTypeStr|string|否|短信类型，`0`表示国内短信，`1`表示彩信，`2`表示国际短信，`3`表示语音|
|templateIdsStr|string|否|多个模板ID，用`;`分开, 如:`templateIdsStr=1;2;3`|
|signature|string|是|签名, 合法性验证|

提示:

1. 获取统计数据时, 必须指定时间区间. 即 **startDate 与 endDate 的组合** 或者 **days 参数** 需二者取一
2. 查询的天数不超过 100
3. msgTypeStr不填的话默认为0

**请求示例**
```
http://www.sendcloud.net/smsapi/data/sendDay?smsUser=***&days=***&msgTypeStr=***&templateIdsStr=***&signature=***
```

**返回值说明**

|参数|说明|
|:---|:---|
|sendDate|发送日期|
|templateId|短信模板ID|
|msgType|短信类型|
|requestNum|请求总数|
|deliveredNum|送达数量|
|processFailedNum|处理失败数量|
|sendFailedNum|发送失败数量|
|billingNum|计费数量|
|deliveredRatio|送达比例|
|processFailedRatio|处理失败比例|
|sendFailedRatio|发送失败比例|

**返回值示例**
```
{
	"result" : true,
	"statusCode" : 200,
	"message" : "请求成功",
	"info" : {
		"count" : 2,
		"voList" : [{
				"billingNum" : "2",
				"deliveredNum" : "1",
				"deliveredRatio" : "100.00",
				"msgType" : "0",
				"processFailedNum" : "0",
				"processFailedRatio" : "0.00",
				"requestNum" : "1",
				"sendDate" : "2016-09-27",
				"sendFailedNum" : "1",
				"sendFailedRatio" : "100.00",
				"templateId" : "2"
			}, {
				"billingNum" : "7",
				"deliveredNum" : "3",
				"deliveredRatio" : "100.00",
				"msgType" : "0",
				"processFailedNum" : "0",
				"processFailedRatio" : "0.00",
				"requestNum" : "3",
				"sendDate" : "2016-09-09",
				"sendFailedNum" : "3",
				"sendFailedRatio" : "100.00",
				"templateId" : "2"
			}
		]
	}
}
```

- - -  