class Graph
  attr_accessor :v , :e
  def initialize
    @v=["a","b","c","d","e","f"]
    @e=Arcs.new ["0,5", "0,1","0,3","1,3","1,2","2,4","3,2","3,4","5,4"]
  end
end

class Arcs
  attr_accessor :start_a, :end_a
  def initialize(array)
    self.start_a =[]
    self.end_a =[]
    array.each do |point|
      point=point.split(',')
      self.start_a<<point[0]
      self.end_a<<point[1]
    end
  end
  def each(&block)
    0.upto(@start_a.length - 1) do |e|
      yield start_a[e].to_i, end_a[e].to_i
    end
  end
end


class Nodo
  attr_accessor :color, :distance, :key, :adj, :pigreco
  def initialize(point, graph)
    self.color=0
    self.distance=graph.v.size+1
    self.key=point
    self.adj=[]
    self.pigreco=nil
  end
  
  def get_adj(nodi, graph, b)
    array=Array.new
    graph.e.each do |x,y|
      array<<b.find(b.nodi, graph.v[y]) if graph.v[x]==self.key
      array<<b.find(b.nodi, graph.v[x]) if graph.v[y]==self.key
    end
    array
    
  end
  
  def to_s
    "nodo #{self.key} con distanza #{self.distance}\n"
  end
end