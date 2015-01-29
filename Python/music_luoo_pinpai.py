import urllib2 
print 'Please input you want download music name:'
name=raw_input()
url = 'http://luoo.waasaa.com/low/pinpai/'+ name+'.mp3'
f = urllib2.urlopen(url)  
music = f.read()  
with open(name+'.mp3', "wb") as code:      
    code.write(music)