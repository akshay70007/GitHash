// GitHash.cpp : Entry point
#include <iostream>
#include <string>

using namespace std;

static std::string g_commit_hash;


void parse_commit(int argCount, char* argValue[])
{
    for (int i = 1; i < argCount; i++)
    {
        string arg = argValue[i];

        if (arg.rfind("--commit=", 0) == 0)
        {
            g_commit_hash = arg.substr(9); 
        }
    }
}

int main(int argCount, char* argValue[])
{
    parse_commit(argCount, argValue);

    if (g_commit_hash.empty())
    {
        cout << "Commit hash not provided\n";
        cout << "Usage: GitHash --commit=<hash>\n";
        return 1;
    }

    cout << "Git Commit Hash:\n"
        << g_commit_hash << endl;

    return 0;
}
