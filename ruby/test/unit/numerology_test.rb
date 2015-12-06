# encoding: utf-8

require "test/unit"
require_relative "../../numerology"

class ChineseToArabic < Test::Unit::TestCase
    def test_nil
        assert_equal(Numerology.chineseToArabic(nil), 0)
    end
    
    def test_numbers
        assert_equal(Numerology.chineseToArabic("〇"), 0)
    	assert_equal(Numerology.chineseToArabic("三"), 3)
	assert_equal(Numerology.chineseToArabic("〇三"), 3)
    	assert_equal(Numerology.chineseToArabic("二百〇五"), 205)
	assert_equal(Numerology.chineseToArabic("三十"), 30)
	assert_equal(Numerology.chineseToArabic("十三"), 13)
        assert_equal(Numerology.chineseToArabic("一億三万四千五百七十三"), 100034573)
        assert_equal(Numerology.chineseToArabic("一億百九十万一"), 101900001)
        assert_equal(Numerology.chineseToArabic("四十九億八百二十七万四千百七十三"), 4908274173)
        assert_equal(Numerology.chineseToArabic("八千五百二億八千九百五十七万二千三百六十五"), 850289572365)
        assert_equal(Numerology.chineseToArabic("七十五兆九百十三億七千五百九十二万八千三百五"), 75091375928305)
        assert_equal(Numerology.chineseToArabic("十二兆三千四百五十六億七千八百九十萬兩千三百四十五"), 12345678902345)
    end
end
