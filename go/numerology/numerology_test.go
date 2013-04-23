package numerology

import "testing"

func Test_Zero(t *testing.T) {
    result := CtoA("0")
    if result != 0 {
        t.Errorf("CtoA(0) == %d, want %f", result, 0)
    }
}

func TestLargeNumbers(t *testing.T) {
    var nums = map[string] float64 {
        "一億三万四千五百七十三": 100034573,
	"一億百九十万一": 101900001,
	"四十九億八百二十七万四千百七十三": 4908274173,
	"八千五百二億八千九百五十七万二千三百六十五": 850289572365,
	"七十五兆九百十三億七千五百九十二万八千三百五": 75091375928305,
	"十二兆三千四百五十六億七千八百九十萬兩千三百四十五": 12345678902345,
    }

    for num, expected := range nums {
        result := CtoA(num)
	if result != expected {
	    t.Errorf("CtoA(%s) == %f, want %f", num, result, expected)
        }
    }
}