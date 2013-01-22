# encoding: UTF-8

require "test/unit"
require_relative "../../shuzi"

class ChineseToArabic < Test::Unit::TestCase
    def test_NilParameters
        assert_equal(Shuzi.chineseToArabic(nil), nil)
    end

    def test_WithZero
        assert_equal(Shuzi.chineseToArabic("二百〇五"), 205)
    end

    def test_LargeNumbers
        assert_equal(Shuzi.chineseToArabic("一億三万四千五百七十三"), 100034573)
        assert_equal(Shuzi.chineseToArabic("一億百九十万一"), 101900001)
        assert_equal(Shuzi.chineseToArabic("四十九億八百二十七万四千百七十三"), 4908274173)
        assert_equal(Shuzi.chineseToArabic("八千五百二億八千九百五十七万二千三百六十五"), 850289572365)
        assert_equal(Shuzi.chineseToArabic("七十五兆九百十三億七千五百九十二万八千三百五"), 75091375928305)
        assert_equal(Shuzi.chineseToArabic("十二兆三千四百五十六億七千八百九十萬兩千三百四十五"), 12345678902345)
    end
end
