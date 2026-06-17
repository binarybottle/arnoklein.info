


	if(document.location == top.location)
		cmPageURL = document.location;
	else
		cmPageURL = document.referrer;

document.write('<scr'+'ipt language="javascript" src="http://72.32.12.152/CM/index.jsp?pub=cm.latimes&sz=728x90&zone=&opt=&typ=1&ord='+Math.floor(Math.random() * 1000000)+'&url='+cmPageURL+'"></scr'+'ipt>');			
