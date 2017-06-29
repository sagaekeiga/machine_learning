# -*- coding: utf-8 -*-

require 'natto'

txt = '仙台は風が強い'

natto = Natto::MeCab.new
natto.parse(txt) do |n|
  if n.feature.include?("地域")
      puts "#{n.surface}: #{n.feature}"
  end
end