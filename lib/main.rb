require "erb"

class Basicerb

  attr_reader :html, :name

  def initialize(name)
    @name = name
    @layout = File.read('./templates/layout.erb')
    @template = File.read('./templates/index.erb')
  end

  def render
    templates = [@template, @layout]
    templates.inject(nil) do | prev, temp |
      _render(temp) { prev } # block is accepted by yield in template
    end
  end

  def _render(temp)
    ERB.new(temp, 0, "", "@html").result( binding )
  end
end

renderer = Basicerb.new("Alex")
renderer.render

puts(renderer.html)

