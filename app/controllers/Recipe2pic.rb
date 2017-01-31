# coding: utf-8
require 'mechanize'
require 'natto'
=begin
def initialize
  @berbs = Array.new
  @nouns = Array.new
  @picpass = Array.new
  @steps = Array.new
  @urls = Array.new
end
=end
def get_steps(url)
  #imgフォルダ作成
  #dir_path = "./imgs"
  #FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
  steps = Array.new
  puts "レシピデータ取得開始"
  #レシピのスクレイピング
  agent = Mechanize.new
  search_page = agent.get(url)
  title = search_page.search('.clearfix h1').inner_text
  search_page.search('.step').each do |item|
    steps << item.search('dl dd p').inner_text
    puts "..."
  end
  puts "done"
  return steps
end
def get_verbs(step)
  puts "形態素解析"
  #レシピの形態素解析
  natto = Natto::MeCab.new
  i=0
  berbs=Array.new
  natto.parse(step) do |n|
    if n.feature.split(',')[0]=="動詞"
      berbs << "#{n.feature.split(',')[-3]}"
    end
  end
  berbs.delete("する")
  berbs.delete("下さる")
  berbs.delete("くださる")
  berbs.delete("なる")
  puts "done"
  p "berbs: #{berbs}"
  return berbs
end

def get_nouns(step)
  puts "形態素解析"
  #レシピの形態素解析
  natto = Natto::MeCab.new
  i=0
  nouns=Array.new
    natto.parse(step) do |n|
      if n.feature.split(',')[0]=="名詞"
        nouns << "#{n.feature.split(',')[-3]}"
      end
    end
    puts "..."
  puts "done"
  p nouns
  return nouns
end

def get_pic(noun)
  puts "画像取得..."
  urls = Array.new
  agent = Mechanize.new
  search_page = agent.get("http://www.irasutoya.com/search?q=#{noun}")
  node=search_page.search('.date-outer')
  i=0
  node.first(5).each do |item|
    begin 
      _txt = item.search('div div div div.boxim a script').inner_text
      #raise NoMethodError # catch する
      _txt = _txt.gsub(/s72-c/,"")
      _txt = _txt.match(/http(s?):(.+)jpg|http(s?):(.+)png/).to_a
      p urls << _txt[0]
      #picpass << filename =  "./img/" + "#{noun}#{i}" + ".png"
      #agent.get(_txt).save_as(filename)
      i=i+1
    rescue => e
      p e.message
      p"@resque"
    end
  end
  puts "done"
  return urls
end
