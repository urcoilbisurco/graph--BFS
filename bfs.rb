require 'utils'
  
module Bfs
  
  class Nodo < Utils::Nodo
    attr_accessor :distance
    def initialize(point, graph)
      self.distance=graph.v.size+1
      super(point,graph)
    end
    def to_s
      "node #{self.key} with distance #{self.distance}\n"
    end
  end
  
  
  class Bfs
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
  
    def create_BFS(s, graph)
      s=find(@nodi, s)
      s.color=1
      s.distance=0
      a=[]
      a<<s
      while !a.empty?
        w=a.first
        w.get_adj(@nodi, graph, self).each do |v|
          if v.color==0
            v.color=1
            v.distance=w.distance+1
            v.pigreco=w
            a<<v
          end
        end
        w.color=2
        a.shift
      end
    end
  
    def find(nodi,s)
      nodi.each {|n|  return n if n.key==s}
    end
  
    def to_s
      @nodi.sort!{|x,y| x.distance<=>y.distance}.each {|n|  n }
    end
  end
end

g=Utils::Graph.new
b=Bfs::Bfs.new(g)
b.create_BFS("a", g)
puts b.to_s