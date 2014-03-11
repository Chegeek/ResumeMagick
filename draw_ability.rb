require 'RMagick'

include Magick

class Ability
  attr_accessor :name, :level
  def initialize(name,level)
    @name = name
    @level = level
  end
end

def decide_ability_color(ability)
  case ability.level 
    when 1 then
      "#555"
    when 2 then
      "#666"
    when 3 then
      "#777"
    when 4 then
      "#999"
    when 5 then
      "#bbb"
    when 6 then
      "sienna"
    when 7 then
      "sienna1"
    end
end

abilities = []
abilities << Ability.new("Ruby,Python,Rails",5)
abilities << Ability.new("CSS,Html,jQuery",4)
abilities << Ability.new("C language",3)
abilities << Ability.new("Matlab",3)
abilities << Ability.new("laTex",2)
abilities << Ability.new("VHDL,FPGA",2)
abilities << Ability.new("Java",1)

# INITIALIZE ALL

$MARGIN = [130,130,130,130] #LEFT, TOP, RIGHT, BOTTOM
$BORN_YEAR = 1992

$Titles = ["生活轨迹 Development of my Life", "代码总量", "Introduction 介绍"] 
#TODO:$Titles = read_title("data.csv")
$Descriptions = ["Lorism"]
#TODO:$Descriptions = read_description("data.csv")

# Create the canvas to draw on

puts "Drawing ability... "
canvas = ImageList.new

f = File.open('CV_interest.jpg')
blob = f.read
canvas.from_blob(blob)

# Draw Titles 

title = Draw.new
title.fill('white')
title.stroke('transparent')
title.pointsize(30)
title.font("Yapi_zh.otf") 
title.font_weight("bold")
title.font_style(ItalicStyle)
title.text(130,880,$Titles[1])
title.draw(canvas)

# Draw axes

axes = Draw.new
axes.fill_opacity(0)
axes.stroke('#aaa')
axes.stroke_width(1)
for i in (0..4)
  if i%2 == 0
    axes.stroke('lightcyan2')
    axes.stroke_dasharray(4,2)
  else
    axes.stroke_dasharray(2,4)
    axes.stroke('lightgrey')
  end
  axes.line(130,950+i*62.5,130+1494,950+i*62.5)
end
axes.draw(canvas)

### Draw graph ###
xp = 150
for ability in abilities
  size = ability.level * 50 
  gc = Draw.new
  gc.fill(decide_ability_color(ability))
  gc.fill_opacity(0.9)
  gc.stroke('transparent')
  gc.stroke_width(0)

  gc.path("M#{xp},950 l#{size},0 l0,#{size} c#{-0.12*size},#{-0.36*size} #{-0.64*size},#{-0.88*size} #{-size},#{-size}")

  gc.annotate(canvas, 0, 0, xp+size  , 940 , "#{5*ability.level}%") {
    self.font = "Bauhaus.ttc"
    self.fill = '#aaa'
    self.stroke = 'transparent'
    self.pointsize = 26 
  }

  gc.stroke("#aaa")
  gc.stroke_width(1)
  gc.stroke_dasharray(4,2)
  gc.line(xp+size,950+size,xp+size+20,950+size+20)
  gc.annotate(canvas, 0, 0, xp+size+25 , 950+size+35 , ability.name) {
    self.font = "Bauhaus.ttc"
    self.fill = '#aaa'
    self.stroke = 'transparent'
    self.pointsize = 18 
    self.rotation = 45
  }
  gc.draw(canvas)
  xp = xp+size+65
end


# All in All
canvas.write("CV_ability.jpg")
# exec 'open ./CV_ability.jpg'


