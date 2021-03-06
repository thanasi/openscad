// file autogenerated by platonicSTLgen
// author: thanasi athanassiadis (thanasi@uchicago.edu)
// script dated: august 25, 2012

include <../platonic.scad>

// units are mm

rad = 2.070155;

 poly = icosahedron(rad);

for(i = [ [0.000000,0.000000,0.000000] ])
{
    translate(i)
    display_polyhedron(poly);
}

module display_polyhedron(poly) 
{
polyhedron(points = poly[0], triangles = poly[1]);
}

