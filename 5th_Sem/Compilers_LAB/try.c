void printStr(char *buff){
    int bytes=sizeof(buff)/sizeof(char);
    __asm__ __volatile__(
        "movl $1, %%eax \n\t"
        "movq $1, %%rdi \n\t"
        "syscall \n\t"
        :
        :"S"(buff),"d"(bytes)
    );
}
int main(){

    char buff[6]="Hello\n";
    
    printStr(buff);
    return 0;

}