Sets
    i   products   / product1, product2 /
    j   resources  / labor, material /;

Parameters
    c(i)   profit per unit of product    / product1 20, product2 30 /
    a(i,j) resource consumption per unit / product1.labor 3, product1.material 4
                                          product2.labor 4, product2.material 3 /;

Scalar b(j)  resource availability / labor 40, material 50 /;

Variables
    x(i)   units of products to produce
    z      total profit;

Positive Variable x;

Equations
    profit   define objective function
    cons(j)  resource constraints;

profit.. 
    z =e= sum(i, c(i)*x(i));

cons(j).. 
    sum(i, a(i,j)*x(i)) =l= b(j);

Model productModel /all/;

Solve productModel using lp maximizing z;

Display x.l, z.l;
