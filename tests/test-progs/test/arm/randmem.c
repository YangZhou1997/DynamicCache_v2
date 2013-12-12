#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>

void nop( int delay ){
    int tmp,i;
    for( i=0; i<delay; i++ )
        tmp = i + tmp;
}

int main(int argc, char **argv) {
    int SEED = 2;
    int MEM_SIZE = 1024 * 1024; // *32 bits (number of ints)
    int DURATION = 6 * 1000 * 1000; //us
    int DELAY_OPS = 1000; //us between mem requests

    int opt;
    while( ( opt = getopt( argc, argv, "s:d:p:" ) ) != -1 ){
        switch( opt ){
            case 's':
                MEM_SIZE = 1024 * 1024 * atoi(optarg); // *32 MB
                break;
            case 'd':
                DURATION = atoi(optarg); // seconds
                break;
            case 'p':
                DELAY_OPS = atoi(optarg); // us
                break;
            default:
                break;
        }
    } 

    int * mem = ( int* ) malloc( sizeof( int ) * MEM_SIZE );
    int elapsed = 0;
    int tmp;
    srand( SEED );

    while( elapsed < DURATION ){
        int read_addr  = rand() % MEM_SIZE;
        int write_addr = rand() % MEM_SIZE;
        tmp = mem[read_addr];
        elapsed += DELAY_OPS;
        nop(DELAY_OPS);
    }

}

