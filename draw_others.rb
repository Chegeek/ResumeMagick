require 'RMagick'

include Magick

# INITIALIZE ALL

$MARGIN = [130,130,130,130] #LEFT, TOP, RIGHT, BOTTOM
$BORN_YEAR = 1992

$Titles = ["生活轨迹 Development of my Life", "代码行数", "教育经历", "实习经历","爱好", "技能","奖励","项目经历"] 
#TODO:$Titles = read_title("data.csv")

#TODO:$Descriptions = read_description("data.csv")

def draw_text(xp, yp, step, strs, draw, canvas) # xp,yp is X,Y position. draw is the drawing method, canvas is where to draw on
  for str in strs
    yp = yp + step
    draw.annotate(canvas,647,600,xp,yp,str){
      draw.fill = '#ddd'
      draw.stroke = 'transparent'
      draw.pointsize = 20
    # self.font = "BS.ttf" 
      draw.font = $config["fonts"][3]  
    }
  end
  return yp
end



canvas = ImageList.new

f = File.open('CV_ability.jpg')
blob = f.read
canvas.from_blob(blob)

# title initialize
title = Draw.new
title.fill('white')
title.stroke('transparent')
title.pointsize(30)
# title.font("BS.ttf") 
title.font($config["fonts"][3]) 
title.font_weight("bold")
title.font_style(ItalicStyle)

# Initialize
content = Draw.new
content.fill('white')
content.stroke('transparent')
content.pointsize(20)
# content.font("BS.ttf") 
content.font($config["fonts"][3]) 
content.font_weight("bold")
content.font_style(ItalicStyle)


############ EDUCATION BACKGROUND PART ################

title.text(130,1370,$Titles[2])
strs = [
"哈尔滨工业大学, 电子与信息工程学院, 2010.9 - 2014.6",
"国立交通大学, 资讯工程学院, 2013.2 - 2013.6"
]
step_small = 40
step_big = 60
yp = 1370
X_START_MARGIN = 170
for str in strs
  yp = yp + step_small
  content.text(X_START_MARGIN,yp,str)
end

############### INTERNSHIPS ###################
yp = yp + step_big
title.text(130,yp,$Titles[3])
strs = [
  "",
  # "# COMPANY I",
  # "",
  "【成都超有爱教育教育科技】（百词斩App，Matrix Partners China投资）",
  "",
  "日常工作包括跟用户通过微博或友盟后台进行交流；开发相关的工作包括使",
  "用Python完成了图像识别相关的填图脚本，主要涉及Python的一般编程以及",
  "Python Imgae Library；以及研究利用前端技术完成一单词相关线上游戏的",
  "可行性，并在此基础上完成了一个简单的本地游戏版本，主要涉及jQuery与",
  "Html/Css，并且接触了许多常用物理引擎框架诸如Box2D。",
  "",
  "公司相关网站：http://www.baicizhan.com/. http://www.jiongji.com/",
  "",
  # "# COMPANY II",
  # "",
  "【成都市木桶科技有限公司】（旗下有一原创媒体网站盐科技）",
  "",
  "负责网站从域名注册，开发，部署，上线，维护，SEO优化的一切工作，网",
  "站使用Ruby下的Rails框架开发。",
  "",
  "公司相关网站：http://www.yankeji.cn/"
]

step_small = 25
yp = draw_text(X_START_MARGIN, yp, step_small, strs, content, canvas)

yp = yp + step_big
title.text(130,yp,$Titles[4])
strs= [
"自学钢琴进阶水平 / 单簧管业余高级用户 ",
"科幻迷 / 正能量动漫 / 半吊子黑客 / 摄影家 / 旅行爱好者 / 怀念台湾小资生活 / ",
"轻度强迫症&拖延症患者 / 御宅学入门 / 硬件学生 / 对创客有好感 / ",
"Linux使用者 -> Mac使用者 /  我的目标：学生 -> 工程师 -> 艺术家 /",
]

yp = draw_text(X_START_MARGIN, yp+step_small, step_small, strs, content, canvas)

yp = yp + step_big
title.text(130,yp,$Titles[5])
strs = [
"计算机技能：",
"文档排版（Latex）/ 编程语言(Ruby, Python) / 科学计算（Matlab, Python) /",
"Web开发（Rails, Html, Css）/ 嵌入式开发（C, FPGA）",
"",
"英语：",
"四级 627 / 托福 95 / 六级 575 / 专业四级 PASS "
]
yp = draw_text(X_START_MARGIN, yp+step_small, step_small, strs, content, canvas)
# title.text(130,yp,$Titles[6])

############# PROJECTS ###############
xp = 1754/2
yp = 1370
title.text(xp,yp,$Titles[7])
strs = [
# "#PROJECT I",
# "",
"【基于Zigbee的智能家居安防系统（MT8880拨号模块的实现）】",
"",
"MT8880是一个双音多频（DTMF）收发的模块，可以实现基于电话线的音频",
"收发，能够模拟出电话拨号时发出的声音频率从而实现自动拨号。",
# "",
# "#PROJECT II",
"",
"【二进制数据在图像里的无损隐藏以及复原的实现】",
"",
"利用Interger Wavelet Tranform实现数据在二进制图像里的隐藏算法，并且",
"复原。",
"",
# "#PROJECT III",
# "",
"【通过Python实现单词自动填入图像】",
"",
"使用Python完成了图像识别相关的填图脚本，通过计算机将单词填入图片中，",
"用来简化大量的人工劳动。",
"",
# "#PROJECT IV",
# "",
"【木桶科技旗下网站盐科技的开发与维护】",
"",
"负责网站从域名注册，开发，部署，上线，维护，SEO优化的一切工作，网",
"站使用Ruby下的Rails框架开发。",
"",
"网站的访问网址是：http://www.yankeji.cn/ 。",
"",
# "#PROJECT V",
# "",
"【毕业设计：图像自动识别与距离测量】",
"",
"项目为单目视觉的测距，包含图像处理以及模式识别的相关知识及实现。",
"",
]
yp = yp + step_small
draw_text(xp+50, yp, step_small, strs, content, canvas)

################## DRAW BANNER ##########################

def draw_banner(xp, yp, str, draw, canvas)
  draw.annotate(canvas,0,0,xp,yp,str){
    draw.fill = '#ddd'
    draw.stroke = 'transparent'
    draw.pointsize = 20
    # draw.font = "BS.ttf"
    # draw.font = $config["fonts"][3]  
    # draw.font = "Wawa_zh.otf"
    self.font = $config["fonts"][1]
  }
end

banner = Draw.new
banner.stroke("#ddd")
banner.stroke_width(1)
banner.stroke_dasharray(1,3)
banner.line(1200,2100,1584,2100)
banner.draw(canvas)
banner.annotate(canvas,0,0,200,300," @野火Taffy") {
    self.fill = '#ddd'
    self.pointsize = 30
    self.gravity = SouthEastGravity
    # self.font = "BS.ttf" 
    self.font = $config["fonts"][2]
    # self.font = $config["fonts"][3]  
}

draw_banner(200,250,"M. +861 8654 327 203", banner, canvas)
draw_banner(200,220,"E. davidlin@hit.edu.cn & lindw@nctu.edu.cn", banner, canvas)
draw_banner(200,170,"W. wildflame.org", banner, canvas)

banner.annotate(canvas,0,0,200,125," Twitter@Taffyer, Created by Ruby & ImageMagick") {
    self.fill = '#ddd'
    self.pointsize = 15 
    self.gravity = SouthEastGravity
    # self.font = "BS.ttf" 
    self.font = $config["fonts"][0]
    # self.font = $config["fonts"][3]  
}

title.draw(canvas)
content.draw(canvas)

# All in All
canvas.write("CV.jpg")

inv = canvas.negate()
inv.write('CV_white.jpg')
exec 'open ./CV.jpg'
