// test file for lexer, single line comment
/* 
    test multiple line comments
    should be ignored ideally
    // checkout this nested comment
*/
#define ll long long

extern 

inline int square(int n){
    return n*n;
}

int compare(int a, int b){      // test relational operators
    if(a>b) return a*b-5;
    else if(a==b) return a+5%b;
    else if(a<b) return a^b;
    else if(a>=b) return b|a/2;
    else if(a<=b) return a&b;
}

int fun(int n) {                // test advanced assignemnt operators
    ++n;
    --n;
    n>>=1;
    n<<=2;
    n&=3;
    n|=4;
    n^=5;
    n*=6;
    n/=7;
    n+=8;
    n-=9;
    n%=10;
}

float func(double * a1) {
    return (*a1)*sqrt(a1);
}

enum etest {
    CONTENT, SIZE
};

union utest {
    float f1;
    double f2;
};

volatile int v;

struct s1 {
    _Complex c1;
    _Bool b1;
};

typedef struct s1 s1;

static struct s1 se1;

int main() {
    float f1= .12E-3;
    float f2 =0.e5;
    const double d1 = 13.789e2;
    int s=sizeof(d1);
    register int _r0;
    char *c = &d1;
    char* str= "String, // commments work inside, only escape characters dont\n See!";
    int op=109489;
    s1* ex;
    ex->b1;
    op= f1>f2? 5: 6;
    while(op>0) {
        op=op>>2;
        if(op&1) continue;
        else op = op<<1;
        op--;
    }
    return 0;
}