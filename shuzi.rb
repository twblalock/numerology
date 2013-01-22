# encoding: UTF-8

# Converts Chinese numerals to Arabic (i.e. Western) numerals.
# A work in progress - missing some larger numerals

module Shuzi
    CHINESE_NUMERALS = { # TODO - add larger ones
        "〇" => 0,
        "一" => 1,
        "二" => 2,
        "三" => 3,
        "四" => 4,
        "五" => 5,
        "六" => 6,
        "七" => 7,
        "八" => 8,
        "九" => 9,
        "十" => 10,
        "百" => 100,
        "千" => 1000,
        "萬" => 10000,
        "万" => 10000, # Simplified
        "億" => 100000000,
        "亿" => 100000000 # Simplified
    }

    # Replaces all Chinese numerals in a string
    def self.translateString(argString)
        return argString.gsub(/#{CHINESE_NUMERALS.keys}+/) { |match| self.chineseToArabic(match) }
    end

    # Converts Chinese numerals to Arabic (i.e. Western) numerals
    def self.chineseToArabic(argString)
        last = nil
        prefix = ""
        if argString.length == 0
            return 0
        else
            # Start at the last character and work back to find the full prefix
            last = CHINESE_NUMERALS[argString.slice!(argString.length - 1)]
            # Move backward until we reach a higher character
            while argString.length > 0 # TODO - what if we reach the end of the string?
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
