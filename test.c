
import _importInterface from "externalClass.sc" as importInterface;

interface testInterface{
	int interfaceFunction(int a);
}

public class superClass implements testInterface, importInterface{
	int superMember = +5;
	int interfaceFunction(int a){
		return a+superMember;
	}
}

private class testClass extends superClass{
	float f1 = 0.3f;
	float f2 = 2E-3;
	double d1 = -0.1;
  	uint32_t u32 = 42;

	int testMember = -3;
	int interfaceFunction(int a){
		int returnVal = 9;
		return super.interfaceFunction(testMember);
	}
}

int main()
{
    char c;
    printf("Enter a character: ");

    // Reads character input from the user
    scanf("%c", &c);  
    
    /** %d displays the integer value of a character
     *  %c displays the actual character
     */ 

    printf("ASCII value of %c = %d", c, c);
    return 0;
}
