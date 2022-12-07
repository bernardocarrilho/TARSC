"""

   host1 ------|
            switch1------------|
   host2 ------|               | 
                             router1--------- host5 (web server)
   host3 ------|               | 
            switch2------------|
   host4 ------|

Adding the 'topos' dict with a key/value pair to generate our newly defined
topology enables one to pass in '--topo=mytopo' from the command line.
"""
from mininet.topo import Topo

class MyTopo( Topo):

   def build( self):


        # Add hosts and switches

        h1 = self.addHost( 'h1', ip="10.0.1.10/24", mac="00:00:00:00:00:01" )

        h2 = self.addHost( 'h2', ip="10.0.1.11/24", mac="00:00:00:00:00:02" )

        h3 = self.addHost( 'h3', ip="10.0.2.20/24", mac="00:00:00:00:00:03" )

        h4 = self.addHost( 'h4', ip="10.0.2.21/24", mac="00:00:00:00:00:04" )

        h5 = self.addHost('h5' , ip ="10.0.3.1/24")

        r1 = self.addHost( 'r1')

        s1 = self.addSwitch( 's1')

        s2 = self.addSwitch( 's2')

        

        self.addLink( r1, s1 )

        self.addLink( r1, s2 )

        self.addLink( h1, s1 )

        self.addLink( h2, s1 )

        self.addLink( h3, s2 )

        self.addLink( h4, s2 )

        self.addLink( r1, h5)           
                

topos = { 'mytopo': ( lambda: MyTopo() ) }

