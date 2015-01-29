import urllib2 
print 'Ple input you want download Periodical name:'
Periodicalname=raw_input()
print 'Please input you want download music name:'
name=raw_input()
url = 'http://luoo.waasaa.com/low/luoo/radio'+Periodicalname+'/'+ name+'.mp3'
f = urllib2.urlopen(url)  
music = f.read()  
with open(Periodicalname+'_'+name+'.mp3', "wb") as code:      
    code.write(music)