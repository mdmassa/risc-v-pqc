#include <stdio.h>

int multiplicar_coeficientes(int a, int b, int q);

int main() {
	int res = 0;
	
	for(int i=0; i < 256; i++){
		res = (res + multiplicar_coeficientes(i, i + 1, 3329)) % 3329;
	}
	
	printf("Resultado acumulado: %d\n", res);

	return 0;
}

int multiplicar_coeficientes(int a, int b, int q){
    long long produto = (long long)a * b;
    
    while (produto >= q) {
        produto -= q;
    }
    
    return (int)produto;
}
