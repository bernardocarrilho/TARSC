"""

   host1 --------------|               
                       |        
   host2 --------------|                
                     switch-----------router1--------- host12 (web server)
   host3 --------------|                  |            host 13
                       |                  |            host 14
   host4 --------------|                  |               .
   .                   |                  |               .
   .                   |                  |               .
   .                   |         proxy server (host11)  host 22 
                       |
   host10 -------------|
Adding the 'topos' dict with a key/value pair to generate our newly defined
topology enables one to pass in '--topo=mytopo' from the command line.
"""
from mininet.topo import Topo


class MyTopo( Topo):

   def build( self):
        
        # Add switch and router

        s1 = self.addSwitch( 's1')
        s2 = self.addSwitch('s2')
        j=101
        # add hosts
        for i in range(1,11):
            name = "h%d" % i
            ip = "10.0.0.%d/24" % j 
            h = self.addHost(name, ip = ip)
            self.addLink(h, s1)
            j=j+1
        
       
        self.addLink(s1, s2)
        j=3
        for i in range(1,11):
            name = "w%d" % i
            ip = "10.0.0.%d/24" % i 
            switch = "s%d" %j
            h = self.addHost(name, ip = ip)
            s = self.addSwitch(switch)
            self.addLink(s2,h)
            self.addLink(s, s2)  
            j=j+1 

	
        proxy = self.addHost('proxy', ip = "10.0.0.11/24")
        self.addLink(s2,proxy)
        
                        

topos = { 'mytopo': ( lambda: MyTopo() ) }

