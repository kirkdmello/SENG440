#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

int z_table[15] = {25735, 15192, 8027, 4074, 2045, 1023, 511, 255, 127, 63, 31, 15, 7, 3, 1};

void cordic_V_fixed_point(int *x, int *y, int *z){
    int x_temp_1, y_temp_1, z_temp;
    int x_temp_2, y_temp_2;
    register int i;

    x_temp_1 = *x;
    y_temp_1 = *y;
    z_temp = 0;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + y_temp_1;
        y_temp_2 = y_temp_1 - x_temp_1;
        z_temp += z_table[0];
    }else{
        x_temp_2 = x_temp_1 - y_temp_1;
        y_temp_2 = y_temp_1 + x_temp_1;
        z_temp -= z_table[0];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 1);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 1);
        z_temp += z_table[1];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 1);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 1);
        z_temp -= z_table[1];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 2);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 2);
        z_temp += z_table[2];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 2);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 2);
        z_temp -= z_table[2];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 3);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 3);
        z_temp += z_table[3];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 3);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 3);
        z_temp -= z_table[3];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 4);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 4);
        z_temp += z_table[4];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 4);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 4);
        z_temp -= z_table[4];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 5);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 5);
        z_temp += z_table[5];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 5);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 5);
        z_temp -= z_table[5];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;
    
    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 6);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 6);
        z_temp += z_table[6];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 6);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 6);
        z_temp -= z_table[6];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 7);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 7);
        z_temp += z_table[7];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 7);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 7);
        z_temp -= z_table[7];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 8);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 8);
        z_temp += z_table[8];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 8);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 8);
        z_temp -= z_table[8];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;
    
    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 9);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 9);
        z_temp += z_table[9];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 9);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 9);
        z_temp -= z_table[9];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 10);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 10);
        z_temp += z_table[10];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 10);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 10);
        z_temp -= z_table[10];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 11);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 11);
        z_temp += z_table[11];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 11);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 11);
        z_temp -= z_table[11];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;
    
    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 12);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 12);
        z_temp += z_table[12];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 12);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 12);
        z_temp -= z_table[12];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 13);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 13);
        z_temp += z_table[13];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 13);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 13);
        z_temp -= z_table[13];
    }
    
    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    if(y_temp_1 > 0){
        x_temp_2 = x_temp_1 + (y_temp_1 >> 14);
        y_temp_2 = y_temp_1 - (x_temp_1 >> 14);
        z_temp += z_table[14];
    }else{
        x_temp_2 = x_temp_1 - (y_temp_1 >> 14);
        y_temp_2 = y_temp_1 + (x_temp_1 >> 14);
        z_temp -= z_table[14];
    }

    x_temp_1 = x_temp_2;
    y_temp_1 = y_temp_2;

    *x = x_temp_2;
    *y = y_temp_2;
    *z = z_temp;
};

void verify(int x_i_init, int y_i_init, int z_i_init, int x_i, int y_i, int z_i) {
    double x_d_init, y_d_init, z_d_init, x_d, y_d, z_d;

    x_d_init = (double)x_i_init / (1 << 15);        /* float image of x_i_init */
    y_d_init = (double)y_i_init / (1 << 15);        /* float image of y_i_init */
    z_d_init = (double)z_i_init / (1 << 15);        /* float image of z_i_init */
    x_d = ((double)x_i / (1 << 15)) * 0.607252935;  /* float image of x_i */
    y_d = ((double)y_i / (1 << 15)) * 0.607252935;  /* float image of y_i */
    z_d = ((double)z_i / (1 << 15));                /* float image of z_i */

    FILE *out_file;
    if ((out_file = fopen("results.txt", "a"))== NULL) {
        printf("Could not create output file. Printing results to console...\n\n");
        printf( "x_i_init = %5i\tx_d_init = %f\n", x_i_init, x_d_init);
        printf( "y_i_init = %5i\ty_d_init = %f\n", y_i_init, y_d_init);
        printf( "z_i_init = %5i\tz_d_init = %f (rad)\n\n", z_i_init, z_d_init);    

        printf( "x_i_calc = %5i\tx_d_calc = %f\n", x_i, x_d);
        printf( "y_i_calc = %5i\ty_d_calc = %f\n", y_i, y_d);
        printf( "z_i_calc = %5i\tz_d_calc = %f (rad)\n\n", z_i, z_d);        
        
        printf( "Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\n", sqrt(x_d_init*x_d_init + y_d_init*y_d_init));
        
    }else{
        fprintf(out_file, "x_i_init = %5i\tx_d_init = %f\n", x_i_init, x_d_init);
        fprintf(out_file, "y_i_init = %5i\ty_d_init = %f\n", y_i_init, y_d_init);
        fprintf(out_file, "z_i_init = %5i\tz_d_init = %f (rad)\n\n", z_i_init, z_d_init);    

        fprintf(out_file, "x_i_calc = %5i\tx_d_calc = %f\n", x_i, x_d);
        fprintf(out_file, "y_i_calc = %5i\ty_d_calc = %f\n", y_i, y_d);
        fprintf(out_file ,"z_i_calc = %5i\tz_d_calc = %f (rad)\n\n", z_i, z_d);        
        
        fprintf(out_file, "Modulus = SQRT(x_d_init^2 + y_d_init^2) = %f\n", sqrt(x_d_init*x_d_init + y_d_init*y_d_init));        
    }
    fclose(out_file);
}



void main(int argc, char* argv[]){
    
    int x_i_init, y_i_init, z_i_init;    /* initial values */    
    int x_i, y_i, z_i;                   /* integer (fixed-point) variables */
    char *token;
    const char del[2] = ",";
   
 
    if (argc < 2) {
        printf("Expected 1 argument, %d given\n\n", argc);
        printf("Usage: cordic_main.exe <input_file>  , where input_file is the name of a text file, comma delimited,\nwhere each row has a value for x,y,z\n\n");
        exit(0);
    }

    FILE *input_file;
    if ((input_file = fopen(argv[1], "r")) == NULL) {
	perror(argv[1]);
        exit(1);
    };

    char line[256]; 

    int i = 0;

    while (fgets(line, sizeof(line), input_file)) {
        token = strtok(line, del);
	    x_i = (x_i_init = (int) strtol(token, (char **)NULL, 10));
        token = strtok(NULL, del);
	    y_i = (y_i_init = (int) strtol(token, (char **)NULL, 10));
	    token = strtok(NULL, del);
	    z_i_init = (int) strtol(token, (char **)NULL, 10);
        
        //printf("Vectorizing CORDIC: \n\n");
                cordic_V_fixed_point(&x_i, &y_i, &z_i);
                verify(x_i_init, y_i_init, z_i_init, x_i, y_i, z_i);            
        }
         fclose(input_file);
         return;
} /* END of main() function */
