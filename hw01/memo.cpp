#include<bits/stdc++.h>
using namespace std;

const int N = 1e5;
int n, m, a[N + 5], ans;

int main() {
    scanf("%d%d", &n, &m);
    for(int i = 1; i <= n; i++) scanf("%d", &a[i]), ans += a[i];
    printf("%d\n", ans);
    return 0;
}