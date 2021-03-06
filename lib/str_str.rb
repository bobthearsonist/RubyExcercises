# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    (0..haystack.length).each do |i| 
        break if i+needle.length > haystack
        return i if haystack[i,needle.length].eql?(needle)
    end
    return -1
end

# not fair lol
def str_str_hash(haystack, needle)
    haystack.index(needle) || -1
end