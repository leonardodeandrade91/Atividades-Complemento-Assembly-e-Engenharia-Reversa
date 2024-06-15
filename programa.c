#include <unistd.h>

int main(int argc, char *argv[]) {
    char *msg = "Oi\n";

    write(STDOUT_FILENO, msg, 3);

    return 0;
}
