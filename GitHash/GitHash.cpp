// GitHash.cpp : Defines the entry point for the application.
//

#include "GitHash.h"
#include "version.h"

using namespace std;

//extern const char GIT_COMMIT_HASH[];

int main()
{
	cout << "Git Commit Hash \n" << GIT_COMMIT_HASH<<endl;
	return 0;
}
