class Solution:
    def reverse(self, x: int) -> int:
        rev=0
        Sign=-1 if x<0 else 1
        x=abs(x)
        while x>0:
            lastDigit=x%10
            rev=rev*10+lastDigit
            x=x//10
        rev*=Sign
        if rev <-2**31 or rev>2**31 -1:
            return 0
        return rev