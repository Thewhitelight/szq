#coding=utf-8
import urllib2    
url='http://www.baidu.com'
request=urllib2.Request(url)
res=urllib2.urlopen(request)
urlstring=res.read()
urlred=res.geturl()#查找源地址
urlinfo=res.info()
urlcode=res.getcode()
#print urlstring+'\n************\n'+urlred
#with open('test.html',"w") as code: #保存为文件
#	code.write(urlstring)
#s=urllib2.get_host()
print urlcode
print urlinfo