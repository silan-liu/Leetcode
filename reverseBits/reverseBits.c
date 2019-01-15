#include <stdlib.h>
#include <stdio.h>

// https://leetcode.com/problems/reverse-bits/submissions/
uint32_t reverseBits(uint32_t n) {
    uint32_t result = 0;
    int count = 32;
    while (count > 0) {
        int bit = n & 0x1;

        result <<= 1;
        result |= bit;

        n >>= 1;

        count -= 1;
    }   

    return result;
}

int main(int argc, char const *argv[])
{
    uint32_t result = reverseBits(4294967293);
    printf("%u", result);
    return 0;
}
