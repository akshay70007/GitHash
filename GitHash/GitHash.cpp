#include <iostream>
#include <string>

#ifndef GIT_COMMIT_HASH
#define GIT_COMMIT_HASH "unknown"
#endif

void print_help(const char* prog) {
    std::cout <<
        "Usage: " << prog << " [options]\n"
        "\nOptions:\n"
        "  --help        Show this help message\n"
        "  --version     Show version information\n"
        "\nBuild info:\n"
        "  Git commit:   " << GIT_COMMIT_HASH << "\n";
}

int main(int argc, char* argv[]) {
    if (argc > 1) {
        std::string arg = argv[1];
        if (arg == "--help") {
            print_help(argv[0]);
            return 0;
        }
        if (arg == "--version") {
            std::cout << "Git commit: " << GIT_COMMIT_HASH << "\n";
            return 0;
        }
    }

    std::cout << "Normal execution...\n";
    return 0;
}
