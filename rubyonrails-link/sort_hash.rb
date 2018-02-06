# Got stumped by a question in an interview. It was a lot of fun, but I couldn't figure it out. Was wondering about how difficult it should have been for me?
# [10:15 AM]
# Given the following hash, sort it in descending order by value. If the values of two or more keys are the same, then sort those matching values by their keys instead in ascending order.
#
# `hash = {214=>4, 197=>3, 137=>3, 216=>3, 28=>2}`
#
# answer should be: `{214=>4, 137=>3, 197=>3, 216=>3, 28=>2}`

hash = {214=>4, 197=>3, 137=>3, 216=>3, 28=>2}
p hash.sort{|(k1,v1),(k2,v2)| v1 == v2 ? k1 <=> k2 : 0}.to_h

# Brandon Dees [10:18 AM]
# i think that might be a bad question... hash order isn't guaranteed.
# it happens to be stable in ruby's hash implementation but IIRC that's
# changing in an upcoming version of the language
# so a "sorted hash" is kind of a meaningless concept.
# you could traverse it by ordered keys or by ordered values,
# but the value itself is not necessarily sortable, by definition