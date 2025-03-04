#include <vector>
#include <string>
typedef enum { typeCon, typeId, typeOpr } nodeEnum;
/* constants */
typedef struct {
    int value; /* value of constant */
} conNodeType;
/* identifiers */
typedef struct {
    int i; /* subscript to sym array */
} idNodeType;
/* operators */
typedef struct {
    int oper; /* operator */
    int nops; /* number of operands */
    struct nodeType *op[1]; /* operands (expandable) */
} oprNodeType;
typedef struct nodeType{
    nodeEnum type; /* type of node */
    int label;
 /* union must be last entry in nodeType */
 /* because operNodeType may dynamically increase */
 union {
    conNodeType con; /* constants */
    idNodeType id; /* identifiers */
    oprNodeType opr; /* operators */
 };
} nodeType;
extern int sym[26];
extern nodeType* addr[26];