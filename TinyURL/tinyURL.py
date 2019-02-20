#coding=utf8
# https://leetcode.com/problems/encode-and-decode-tinyurl/submissions/
import hashlib

# 使用hash值
class Codec:
    map = {}

    def encode(self, longUrl):
        list = longUrl.split("//")
        last = ""
        scheme = ""
        if len(list) == 2:
            scheme = list[0]
            last = list[1]
        
        m2 = hashlib.md5()   
        m2.update(last)   
        md5 = m2.hexdigest()

        shortUrl = scheme + "//" + "tinyurl.com/" + md5
        self.map[md5] = last
        print(shortUrl)
        return shortUrl

    def decode(self, shortUrl):
        list = shortUrl.split("//")
        scheme = ""
        last = ""
        if len(list) == 2:
            scheme = list[0] + "//"
            last = list[1]

        list = last.split("/")

        md5 = ""
        if len(list) == 2:
            md5 = list[1]

        last = self.map[md5]
        longUrl = scheme + last
        return longUrl

codec = Codec()
print(codec.decode(codec.encode("https://www.baidu.com/11.png")))


# 使用数字递增
class Codec1:
    
    def __init__(self):
        self.short_to_long = {}
        self.long_to_short = {}
        self.count = 0

    def encode(self, longUrl):
        """Encodes a URL to a shortened URL.
        
        :type longUrl: str
        :rtype: str
        """
        if self.long_to_short.has_key(longUrl) == False :
            self.count += 1
            shortUrl = "http://tinyurl.com/" + str(self.count)
            self.short_to_long[shortUrl] = longUrl
            return shortUrl
        else:
            return self.long_to_short[longUrl]

    def decode(self, shortUrl):
        """Decodes a shortened URL to its original URL.
        
        :type shortUrl: str
        :rtype: str
        """
        return self.short_to_long[shortUrl]
        

# Your Codec object will be instantiated and called as such:
codec1 = Codec1()
print(codec1.decode(codec1.encode("https://www.baidu.com")))