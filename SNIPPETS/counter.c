/* Used this to match id's from one file to id's
** in another file. Was counting the number of upload's
** an id had made.
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int id;
	int id_array[42];	
	int up_array[42];

	for(int i =0; i < 42; i++) {
		id_array[i] = i+1;
		up_array[i] = 0;
	}

	while(scanf("%d", &id) == 1) {
		if( id == id_array[id-1] ) {
			up_array[id-1]++;
		}	
	}

	
	printf("id up\n");
	for(int i=0; i < 42; i++) {
		printf("%d %d\n", id_array[i],up_array[i]);
	}
	return 0;
}
		
