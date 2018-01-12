#equity
df$b.1m.e<-0
df$b.1m.e[df$v.e>0 & df$pi.e.1m.e>=0]<-1
df$c.1m.e<-0
df$c.1m.e[df$v.e<0 & df$pi.e.1m.e<=0]<-1

df$b.3m.e<-0
df$b.3m.e[df$v.e>0 & df$pi.e.3m.e>=0]<-1
df$c.3m.e<-0
df$c.3m.e[df$v.e<0 & df$pi.e.3m.e<=0]<-1

df$b.1y.e<-0
df$b.1y.e[df$v.e>0 & df$pi.e.1y.e>=0]<-1
df$c.1y.e<-0
df$c.1y.e[df$v.e<0 & df$pi.e.1y.e<=0]<-1

#gold
df$b.1m.g<-0
df$b.1m.g[df$v.g>0 & df$pi.e.1m.g>=0]<-1
df$c.1m.g<-0
df$c.1m.g[df$v.g<0 & df$pi.e.1m.g<=0]<-1

df$b.3m.g<-0
df$b.3m.g[df$v.g>0 & df$pi.e.3m.g>=0]<-1
df$c.3m.g<-0
df$c.3m.g[df$v.g<0 & df$pi.e.3m.g<=0]<-1

df$b.1y.g<-0
df$b.1y.g[df$v.g>0 & df$pi.e.1y.g>=0]<-1
df$c.1y.g<-0
df$c.1y.g[df$v.g<0 & df$pi.e.1y.g<=0]<-1

#housing
df$b.1m.h<-0
df$b.1m.h[df$v.h>0 & df$pi.e.1m.h>=0]<-1
df$c.1m.h<-0
df$c.1m.h[df$v.h<0 & df$pi.e.1m.h<=0]<-1

df$b.3m.h<-0
df$b.3m.h[df$v.h>0 & df$pi.e.3m.h>=0]<-1
df$c.3m.h<-0
df$c.3m.h[df$v.h<0 & df$pi.e.3m.h<=0]<-1

df$b.1y.h<-0
df$b.1y.h[df$v.h>0 & df$pi.e.1y.h>=0]<-1
df$c.1y.h<-0
df$c.1y.h[df$v.h<0 & df$pi.e.1y.h<=0]<-1