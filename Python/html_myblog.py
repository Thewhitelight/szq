# coding:utf-8
import urllib2
url='http://thewhitelight.github.io'
response = urllib2.urlopen(url)  
content = response.read()  
print content  
str=url[-23:]
open(str+'.html','w').write(content)