#include<bits/stdc++.h>
#define ll long long
using namespace std;

const int N = 1e5;
int n, m, a[N * 4 + 5];
ll seg[N * 4 + 5], tag[N * 4 + 5];

void PushUp(int x) { seg[x] = seg[x << 1] + seg[x << 1 | 1]; }
void PushDown(int x, int l, int r) {
    int mid = (l + r) >> 1;
    tag[x << 1] += tag[x], tag[x << 1 | 1] += tag[x];
    seg[x << 1] += 1ll * tag[x] * (mid - l + 1), seg[x << 1 | 1] += 1ll * tag[x] * (r - mid);
    tag[x] = 0;
}

void Init(int x, int l, int r) {
    if(l == r) { seg[x] = a[l]; return; }
    int mid = (l + r) >> 1;
    Init(x << 1, l, mid), Init(x << 1 | 1, mid + 1, r);
    PushUp(x);
}

void Modify(int x,int l, int r, int ql, int qr, int num) {
    if(ql <= l && r <= qr) { seg[x] += 1ll * num * (r - l + 1), tag[x] += num; return; }
    int mid = (l + r) >> 1;
    PushDown(x, l, r);
    if(ql <= mid) Modify(x << 1, l, mid, ql, qr, num);
    if(mid + 1 <= qr) Modify(x << 1 | 1, mid + 1, r, ql, qr, num);
    PushUp(x);
}

ll Query(int x, int l, int r, int ql, int qr) {
    if(ql <= l && r <= qr) return seg[x];
    int mid = (l + r) >> 1; ll ret = 0;
    PushDown(x, l, r);
    if(ql <= mid) ret += Query(x << 1, l, mid, ql, qr);
    if(mid + 1 <= qr) ret += Query(x << 1 | 1, mid + 1, r, ql, qr);
    PushUp(x);
    return ret;
}

int main() {
    scanf("%d%d", &n, &m);
    for(int i = 1; i <= n; i++) scanf("%d", &a[i]);
    Init(1, 1, n);
    for(int i = 1; i <= m; i++) {
        int op, u, v, w;
        scanf("%d", &op);
        if(op == 1) {
            scanf("%d%d%d", &u, &v, &w);
            Modify(1, 1, n, u, v, w);
        } if(op == 2) {
            scanf("%d%d", &u, &v);
            printf("%lld\n", Query(1, 1, n, u, v));
        }
    }
    //system("pause");
    return 0;
}