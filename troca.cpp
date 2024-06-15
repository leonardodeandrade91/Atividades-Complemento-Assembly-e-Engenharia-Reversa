#include <iostream>

using namespace std;

extern "C" int getValorASM(int a); // Receberá o valor do Assembly

int main() {
	cout << "ASM me deu " << getValorASM(32) << endl;

	return 0;
}