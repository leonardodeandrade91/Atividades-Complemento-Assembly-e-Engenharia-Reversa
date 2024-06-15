#include <iostream>

using namespace std;

extern "C" int question(int a);

int main() {
	if(question(26) == 1) {
		cout << "Numero Par!" << endl;
	}
	else {
		cout << "Numero Impar!" << endl;
	}

	return 0;
}