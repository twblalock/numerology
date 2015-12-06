package numerology

import "math"

// TODO these are float64 -- should they be ints?
var nums = map[string] int64 {
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
    "百" : int64(math.Pow(10, 2)),
    "千" : int64(math.Pow(10, 3)),
    "萬" : int64(math.Pow(10, 4)),
    "万" : int64(math.Pow(10, 4)), // Simplified
    "億" : int64(math.Pow(10, 8)),
    "亿" : int64(math.Pow(10, 8)), // Simplified
    "兆" : int64(math.Pow(10, 12)),
    "京" : int64(math.Pow(10, 16)),
    // Everything below this overflows int64, would need math/big to support them
    //"垓" : int64( math.Pow(10, 20)),
    //"秭" : int64(math.Pow(10, 24)),
    //"穰" : int64(math.Pow(10, 28)),
    //"溝" : int64(math.Pow(10, 32)),
    //"沟" : int64(math.Pow(10, 32)), // Simplified
    //"澗" : int64( math.Pow(10, 36)),
    //"涧" : int64(math.Pow(10, 36)), // Simplified
    //"正" : int64(math.Pow(10, 40)),
    //"載" : int64(math.Pow(10, 44)),
    //"载" : int64(math.Pow(10, 44)), // Simplified
}

func CtoA(s string) int64 {
    if s == "" {
        return 0
    }

    runes := []rune(s)
    lastVal := nums[string(runes[len(runes) - 1])]
    runes = runes[0 : len(runes) - 1]

    prefix := ""
    // Start at the last character and work back to find the full prefix
    // by moving backward until prev > last
    for i := len(runes) - 1; i >= 0; i-- {
        prev := string(runes[i])
	if nums[prev] < lastVal && nums[prev] != 0 { // Sometimes zero is used as a placeholder
	    prefix = prev + prefix
	    runes = runes[0 : i]
	} else {
	    break
        }
    }

    var subval int64
    if (prefix == "") {
        subval = 1
    } else {
	subval = CtoA(prefix)
    }
    
    return subval * lastVal + CtoA(string(runes))
}