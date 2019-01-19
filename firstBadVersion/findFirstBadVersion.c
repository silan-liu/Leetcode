#include "stdio.h"
#include "stdlib.h"

// https://leetcode.com/problems/first-bad-version/submissions/
int isBadVersion(int version) {
    if (version == 4) {
        return 1;
    }
    return 0;
}

int firstBadVersion(int n) {
    int l = 1;
    int h = n;

    while (l <= h) {
        int mid = l + (h - l) / 2;
        int result = isBadVersion(mid);
        if (!result) {
            l = mid + 1;
        } else {
            // 第一个
            if (mid == 1) {
                return mid;
            } else {
                if (!isBadVersion(mid - 1)) {
                    return mid;
                }

                h = mid - 1;
            }
        }
    }

    return l;
}

int main(int argc, char const *argv[])
{
    int result = firstBadVersion(5);
    printf("%d", result);
    return 0;
}
