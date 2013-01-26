# encoding: UTF-8

# Converts Chinese numerals to Arabic (i.e. Western) numerals.

module Numerology
    CHINESE_NUMERALS = { # TODO - add larger ones
        "〇" => 0,
        "一" => 1,
        "幺" => 1,
        "二" => 2,
        "兩" => 2,
        "两" => 2,
        "三" => 3,
        "四" => 4,
        "五" => 5,
        "六" => 6,
        "七" => 7,
        "八" => 8,
        "九" => 9,
        "十" => 10,
        "呀" => 10,
        "百" => 10 ** 2,
        "千" => 10 ** 3,
        "萬" => 10 ** 4,
        "万" => 10 ** 4, # Simplified
        "億" => 10 ** 8,
        "亿" => 10 ** 8, # Simplified
        "兆" => 10 ** 12,
        "京" => 10 ** 16,
        "垓" => 10 ** 20,
        "秭" => 10 ** 24,
        "穰" => 10 ** 28,
        "溝" => 10 ** 32,
        "沟" => 10 ** 32, # Simplified
        "澗" => 10 ** 36,
        "涧" => 10 ** 36, # Simplified
        "正" => 10 ** 40,
        "載" => 10 ** 44,
        "载" => 10 ** 44 # Simplified
    }

    # Replaces all Chinese numerals in a string
    def self.translateString(argString)
        return argString.gsub(/#{CHINESE_NUMERALS.keys}+/) { |match| self.chineseToArabic(match) }
    end

    # Converts Chinese numerals to Arabic (i.e. Western) numerals
    def self.chineseToArabic(argString)
        last = nil
        prefix = ""
        if argString.nil? || argString.empty?
            return 0
        else
            # Start at the last character and work back to find the full prefix
            last = CHINESE_NUMERALS[argString.slice!(argString.length - 1)]
            # Move backward until we reach a higher character
            while argString.length > 0
                prev = CHINESE_NUMERALS[argString[argString.length - 1]]
                if prev < last && prev != 0 # Sometimes zero is used as a placeholder
                    prefix = argString.slice!(argString.length - 1) + prefix
                else
                    break
                end
            end
        end
        return ((prefix.length > 0 ? self.chineseToArabic(prefix) : 1) * last) + self.chineseToArabic(argString)
    end
end
