require 'nokogiri'
require 'open-uri' 
class HomeController < ApplicationController
  def crawler
      (2).downto(1) do |c| #반복문을 돌면서
            if c == 1
                addPage = ""
            else
                addPage = "page#{c}/"
            end
            # url = "https://hanjungv.github.io"  # url을 지정해
            url = "https://github.com/trending"
            doc = Nokogiri::HTML(open(url)) # 열고
            @posts = doc.css('.explore-content') #article 클래스를 갖는 객체들을 전부 post에 담아
            # puts(@posts)
            @posts.each do |x| #각각 돌면서 Result에 추가해줍니다.
                tit = x.css('h3').text.strip
                puts(tit)
                cont = x.css('.post-entry-container .post-entry').text.strip
                @res = Result.new(title: tit, content: cont)
                @res.save
            end
        end
        redirect_to '/'
  end
  def show
        @pr = Result.all
    end
end
