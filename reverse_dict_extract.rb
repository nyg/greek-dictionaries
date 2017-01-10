#!/usr/bin/env ruby

require "nokogiri"
require "open-uri"
require "set"

if ARGV.size != 1
    puts 'One and only one argument is needed'
    exit 1
end

lemmas = SortedSet.new
should_find = 0
found = 0
page = 0

loop do
    uri = URI(URI.encode("http://www.greek-language.gr/greekLang/modern_greek/tools/lexica/reverse/search.html?start=#{page}&lq=#{ARGV[0]}"))
    html_node = Nokogiri::HTML(open(uri).read)

    if page == 0
        should_find = html_node.xpath('//td[@id="found"]').text.gsub(/(\d+).*/, '\1').to_i
        puts "Should find #{should_find} non-distinct words"
    end

    page += 10
    lemmas_node = html_node.xpath('//div[@id="lemmas"]/dl/dt')
    found += lemmas_node.size
    puts "Found #{lemmas_node.size} at #{uri.path}?#{uri.query}"

    lemmas_node.each do | lemma |
        lemmas.add lemma.text.gsub(/,$/, '')
    end

    break if lemmas_node.size != 10
end

if found == should_find
    puts "All good, found #{lemmas.size} distinct words"
    lemmas.each do | e |
        puts e
    end
else
    puts "Error, found only #{found}"
end
