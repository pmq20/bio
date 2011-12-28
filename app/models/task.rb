class Task < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :sequence
  validates_presence_of :a
  validates_presence_of :t
  validates_presence_of :c
  validates_presence_of :g
  after_validation :point_sequences

  def point_sequences
    self.sequence.gsub!(/[^atcgATCG]/,'')
    self.sequence.gsub!('a','A')
    self.sequence.gsub!('t','T')
    self.sequence.gsub!('c','C')
    self.sequence.gsub!('g','G')
    self.sequence.strip!
    
    seq = self.sequence.dup
    seq.gsub!('A',a.to_s)
    seq.gsub!('T',t.to_s)
    seq.gsub!('C',c.to_s)
    seq.gsub!('G',g.to_s)
    xs = seq
    ys = seq[1..-1] + '0'
    zs = seq[2..-1] + '00'
    seqlen = seq.size
    seqend = 0 - (seqlen%3 + 1)
    xs = xs[0..seqend]
    ys = ys[0..seqend]
    zs = zs[0..seqend]
    segcount = seqlen / 3
    self.point_sequence = ''
    0.upto(segcount-1) do |i|
      istart = 3*i
      iend = istart + 2
      x = xs[istart..iend]
      y = ys[istart..iend]
      z = zs[istart..iend]
      self.point_sequence += "#{x} #{y} #{z};\n"
    end
    self.point_sequence_normalized = self.point_sequence.dup
    arr = [a,t,c,g]
    i = 0
    arr.each do |first|
      arr.each do |second|
        arr.each do |third|
          thing = "#{first}#{second}#{third}"
          self.point_sequence_normalized.gsub!(thing,i.to_s)
          i += 1
        end
      end
    end
  end

end
