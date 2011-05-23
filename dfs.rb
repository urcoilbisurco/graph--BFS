require 'utils'

module Dfs

  class Nodo < Utils::Nodo
    attr_accessor :start_time, :end_time
      def initialize(point, graph)
        self.start_time=0
        self.end_time=0
        super(point,graph)
      end

      def to_s
        "node #{self.key} with start_time #{self.start_time} and end_time #{self.end_time}\n"
      end
  end
  
  class Dfs
    attr_accessor :nodi
    def initialize(g)
      @nodi=crea_nodi(g)
    end

    def crea_nodi(g)
      nodi=Array.new
      for v in g.v do
        nodi<<Nodo.new(v, g)
      end
      puts "=> created nodes!"
      nodi
    end
    def create_DFS(graph)
      time=0
      @nodi.each {|v| time=DFS_visit(graph,v,time) if v.color==0}
    end
    def DFS_visit(graph,node,time)
      node.color=1
      time=time+1
      node.start_time=time
      node.get_adj(@nodi,graph,self).each do |u|
        if u.color==0
          u.pigreco=u
          time=DFS_visit(graph, u, time)
        end
      end
      time=time+1
      node.end_time=time
      node.color=2
      time
    end
    def find(nodi,s)
      nodi.each {|n|  return n if n.key==s}
    end
    def to_s
       @nodi.sort!{|x,y| x.start_time<=>y.start_time}.each {|n|  n }
    end
  end
end
g=Utils::Graph.new
b=Dfs::Dfs.new(g)
b.create_DFS(g)
puts b.to_s