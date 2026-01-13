// GitHash.cpp : Entry point
#include <iostream>
#include <string>
#include "version.h"

using namespace std;





int main()
{
   

    cout << "Git Commit Hash:\n"
        << GIT_COMMIT_HASH << endl;

    return 0;
}
