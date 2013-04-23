package numerology

import "math"

// TODO these are float64 -- should they be ints?
var nums = map[string] float64 {
    "〇" : 0,
    "一" : 1,
    "幺" : 1,
    "二" : 2,
    "兩" : 2,
    "两" : 2,
    "三" : 3,
    "四" : 4,
    "五" : 5,
    "六" : 6,
    "七" : 7,
    "八" : 8,
    "九" : 9,
    "十" : 10,
    "呀" : 10,
    "百" : math.Pow(10, 2),
    "千" : math.Pow(10, 3),
    "萬" : math.Pow(10, 4),
    "万" : math.Pow(10, 4), // Simplified
    "億" : math.Pow(10, 8),
    "亿" : math.Pow(10, 8), // Simplified
    "兆" : math.Pow(10, 12),
    "京" : math.Pow(10, 16),
    "垓" : math.Pow(10, 20),
    "秭" : math.Pow(10, 24),
    "穰" : math.Pow(10, 28),
    "溝" : math.Pow(10, 32),
    "沟" : math.Pow(10, 32), // Simplified
    "澗" : math.Pow(10, 36),
    "涧" : math.Pow(10, 36), // Simplified
    "正" : math.Pow(10, 40),
    "載" : math.Pow(10, 44),
    "载" : math.Pow(10, 44), // Simplified
}

func ValueOf(c string) float64 {
    return nums[c]
}

// TODO return an error if an invalid character is found?
func CtoA(s string) float64 {
    if s == "" {
        return 0
    }

    runes := []rune(s)
    lastVal := nums[string(runes[len(runes) - 1])]
    runes = runes[0 : len(runes) - 1]

    prefixChars := ""
    for i := len(runes) - 1; i >= 0; i-- {
        prevChar := string(runes[i])
	if nums[prevChar] < lastVal && nums[prevChar] != 0 {
	    prefixChars = prevChar + prefixChars
	    runes = runes[0 : i]
	} else {
	    break
        }
    }

    var subval float64
    if (prefixChars == "") {
        subval = 1
    } else {
	subval = CtoA(prefixChars)
    }
    return subval * lastVal + CtoA(string(runes))
}