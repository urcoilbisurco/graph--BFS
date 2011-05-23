require 'graph'

class Bfs
  attr_accessor :nodi
  def initialize(g)
    @nodi=crea_nodi(g)
    puts "==> inizializzazione effettuata"
  end

  def crea_nodi(g)
    nodi=Array.new
    for v in g.v do
      nodi<<Nodo.new(v, g)
    end
    puts "=> nodi creati!"
    nodi
  end
  
  def create_BFS(s, graph)
    s=find(@nodi, s)
    s.color=1
    s.distance=0
    a=Array.new
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
    output=nil
    nodi.each do |n|
      if n.key==s
        output=n
      end
    end
    output
  end
  
  def to_s
    @nodi.sort!{|x,y| x.distance<=>y.distance}.each {|n|  n }
  end
end


g=Graph.new
b=Bfs.new(g)
b.create_BFS("a", g)
puts b.to_s